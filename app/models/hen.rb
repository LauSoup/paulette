class Hen < ApplicationRecord
  belongs_to :user
  has_many :requests

  validates :name, presence: true
  validates :price, presence: true
end
