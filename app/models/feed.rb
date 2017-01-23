class Feed < ApplicationRecord

  validates :name, :feed_url, presence: true

end
