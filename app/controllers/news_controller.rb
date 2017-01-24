class NewsController < ApplicationController

  def index
    get_news_from_feed
    @news = News.limit(20).order("published_at desc")
  end

  def update_like_status
    news = News.find(params[:id])
    news.update_attribute(:like_status, params[:liked_status])
    respond_to :json, head: :no_content
  end

  private

  def get_news_from_feed
    Feed.find_each do |feed|
      News.update_from_feed(feed)
    end
  end

end
