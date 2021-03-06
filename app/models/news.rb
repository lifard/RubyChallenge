class News < ApplicationRecord

  belongs_to :feed

  before_save :update_news_status

  enum status: {
    normal: 1,
    interesting: 2,
    boring: 3
  }

  enum like_status: {
    liked: 1,
    disliked: 2
  }

  def self.update_from_feed(feed)
    new_feed = Feedjira::Feed.fetch_and_parse(feed.url)
    add_news(new_feed.entries, feed)
  end

  private

  def update_news_status
    whitelisted_words_count = count_presence(whitelist)
    blacklisted_words_count = count_presence(blacklist)
    result = whitelisted_words_count - blacklisted_words_count

    self.status =
      if result > 0
        News.statuses['interesting']
      elsif result < 0
        News.statuses['boring']
      else
        News.statuses['normal']
      end
  end

  def count_presence(list)
    content_without_tags = ActionController::Base.helpers.strip_tags(content)
    content_words = content_without_tags.downcase.gsub(/[,'!?\.]/, '').split
    counter = 0
    list.each do |word|
      presence =  content_words.count(word.downcase)
      counter += presence
    end
    counter
  end

  def self.add_news(entries, feed)
    entries.each do |entry|
      unless exists?(guid: entry.entry_id)
        create!(
          name:         entry.title,
          content:      entry.summary,
          url:          entry.url,
          published_at: entry.published,
          guid:         entry.entry_id,
          feed_id:      feed.id
        )
      end
    end
  end

  def whitelist
    Keyword.whitelist.map(&:content)
  end

  def blacklist
    Keyword.blacklist.map(&:content)
  end
end
