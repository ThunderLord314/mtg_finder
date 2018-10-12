class Card < ApplicationRecord
	has_many :images
	has_many :expansions, through: :cards_expansion
	has_many :artists, through: :cards_artist
	has_many :types, through: :cards_type

	validates :name, presence: true, uniqueness: true
	validates :artist, presence: true
	validates :expansion, presence: true
	validates :image, presence: true
end
