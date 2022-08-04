class User < ApplicationRecord
  has_many :products
  has_many :carts
  has_many :orders
  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :customer, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
