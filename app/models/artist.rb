class Artist < ApplicationRecord
	has_many :cardartists
	has_many :cards, through: :cardartists

	validates :artist_name, presence: true, uniqueness: true
end
