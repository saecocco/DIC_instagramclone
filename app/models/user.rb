class User < ApplicationRecord
  before_validation { email.downcase! }
  validates :name, presence: true, length: { maximum: 30}
  validates :email, presence: true, uniqueness:true,length: { maximum: 250 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  has_many :pictures
  validates :password, presence: true, length: { minimum: 6 }
  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
end
