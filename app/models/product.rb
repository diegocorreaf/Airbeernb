class Product < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_one_attached :photo

  include PgSearch::Model
  multisearchable against: [:name, :description]

  pg_search_scope :beer_search,
    against: {name: 'A', description: 'B'},
    using: {
      tsearch: { prefix: true }
    }

end
