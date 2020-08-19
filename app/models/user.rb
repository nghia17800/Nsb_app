class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  enum gender: [:Male, :Female, :Both]
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :gender, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
