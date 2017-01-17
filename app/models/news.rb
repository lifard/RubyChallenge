class News < ApplicationRecord

  GOOGLE_NEWS_URI = 'https://news.google.com/news?&output=rss'

  def self.update_from_google_feed
    feed = Feedjira::Feed.fetch_and_parse(GOOGLE_NEWS_URI)
    add_news(feed.entries)
  end

  private

  def self.add_news(entries)
    entries.each do |entry|
      unless exists?(guid: entry.entry_id)
        create!(
          name:         entry.title,
          content:      entry.summary,
          url:          entry.url,
          published_at: entry.published,
          guid:         entry.entry_id
        )
      end
    end
  end
end
