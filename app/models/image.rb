class Image < ApplicationRecord
	belongs_to :cards

	validates :image_name, presence: true
	validates :path, presence: true
end
