class Card < ApplicationRecord
	has_many :images
	has_many :expansions, through: :cards_expansion
	has_many :artists, through: :cards_artist
	has_many :types, through: :cards_type
end
