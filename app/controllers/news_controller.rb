class NewsController < ApplicationController

  def index
    get_news_from_feed
    @news = News.limit(20).order("published_at desc")
  end

  private

  def get_news_from_feed
    Feed.find_each do |feed|
      News.update_from_feed(feed)
    end
  end

end
