class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  
  has_many :products, dependent: :destroy
  validates :name, presence: true, uniqueness: true, on: :update
  validates :address, presence: true, on: :update


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
