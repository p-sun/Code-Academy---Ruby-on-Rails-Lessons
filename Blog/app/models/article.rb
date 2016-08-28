class Article < ApplicationRecord
  # When creating an Article, validate that title is at least 5 chars long
  validates :title, presence: true, length: { minimum: 5 }
end
