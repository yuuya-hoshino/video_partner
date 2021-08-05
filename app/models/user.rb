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

  has_many :following_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  def following?(other_user)
    following_relationships.find_by(follower_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(follower_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(follower_id: other_user.id).destroy
  end

#友達判定
  def matchers
    followings & followers
  end
#ジャンル
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :role
  belongs_to_active_hash :subgenre
end
