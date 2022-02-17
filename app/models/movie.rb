class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_exception
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true
  # validates :poster_url
  # validates :rating
end
