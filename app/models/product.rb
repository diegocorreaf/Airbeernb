class Product < ApplicationRecord
  # belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
