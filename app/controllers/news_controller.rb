class NewsController < ApplicationController

  def index
    News.update_from_google_feed
    @news = News.limit(20).order("published_at desc")
  end

end
