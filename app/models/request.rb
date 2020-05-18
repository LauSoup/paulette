class Request < ApplicationRecord
  belongs_to :user
  belongs_to :hen

  validates :duration, presence: true
end
