class Product < ApplicationRecord
  belongs_to :user
  has_many :purchases, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :beer_search,
    against: {name: 'A', description: 'B'},
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
