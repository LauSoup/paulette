class Hen < ApplicationRecord
  belongs_to :user
  has_many :requests
  has_many :reviews
  has_one_attached :photo
  validates :name, presence: true
  validates :price, presence: true
end
