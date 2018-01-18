class Restaurant < ApplicationRecord

  validates_presence_of :name, :category_id
  
  mount_uploader :image, PhotoUploader
  
  belongs_to :category, optional: true

  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  def is_favorited?(user)
    self.favorited_users.include?(user)
  end

end
