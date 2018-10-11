class Expansion < ApplicationRecord
	has_many :cards, through: :cards_expansions
end
