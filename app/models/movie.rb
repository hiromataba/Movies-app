class Movie < ApplicationRecord
	belongs_to :user
	has_many :reviwes
	mount_uploader :image, ImageUploader
end
