class Hen < ApplicationRecord
  belongs_to :user
  has_many :requests
<<<<<<< HEAD
  has_many :reviews
=======
  has_one_attached :photo

>>>>>>> 78322183d3b8d9cac8faa47667ed29b894911b07
  validates :name, presence: true
  validates :price, presence: true
end
