class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :ratings

  has_many :likes, counter_cache: :likes_counter, dependent: :destroy
  has_many :users, through: :likes, counter_cache: :likes_counter

  mount_uploader :image, ImageUploader

  def liked?(_id)
    users.exists?
  end

  def update_counter(value)
    user.update likes_counter: value
  end
end
