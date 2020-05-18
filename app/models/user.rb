class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hens
  has_many :requests

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

end
