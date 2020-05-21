class Review < ApplicationRecord
  belongs_to :hen
  RATING = [1, 2, 3, 4, 5]
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: RATING }
  validates :content, presence: true, length: { minimum: 10 }

end
