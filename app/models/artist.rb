class Artist < ApplicationRecord
	has_many :cards, through: :cards_artists

	validates :artist_name, presence: true, unqiueness: true
end
