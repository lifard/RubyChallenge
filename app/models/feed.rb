class Feed < ApplicationRecord

  validates :name, :url, :category, presence: true

  enum category: {
    politics: 1,
    sports: 2,
    economics: 3
  }

end
