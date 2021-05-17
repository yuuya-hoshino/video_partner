class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :active_relationships,class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships
  mount_uploader :image_name, ImageUploader
  validates :name, presence: true, length: { maximum: 10 }
  validates :introduction, length: { maximum: 100 }
end
