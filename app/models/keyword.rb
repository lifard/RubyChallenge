class Keyword < ApplicationRecord

  enum category: {
    whitelist: 1,
    blacklist: 2
  }

  validates :content, :category, presence: true

end
