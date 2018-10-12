class Card < ApplicationRecord
	has_many :images
	has_many :cardexpansions
	has_many :expansions, through: :cardexpansions
	has_many :cardartists
	has_many :artists, through: :cardartists
	has_many :cardtypes
	has_many :types, through: :cardtypes

	validates :name, presence: true, uniqueness: true
	validates :artist, presence: true
	validates :expansion, presence: true
	validates :image, presence: true
end
