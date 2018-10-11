class Artist < ApplicationRecord
	has_many :cards, through: :cards_artists
end
