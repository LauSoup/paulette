class Review < ApplicationRecord
  belongs_to :hen
  validates :rating, presence: true
  validates :content, presence: true

end
