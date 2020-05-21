class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :hens
  has_many :requests
  has_one_attached :photo

  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :password, presence: true

end
