class User < ApplicationRecord
  has_many :products
  has_many :carts
  has_many :orders
  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true

  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
#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

#!!!!

#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
