class Expansion < ApplicationRecord
	has_many :cards, through: :cards_expansions

	validates :expansion_name, presence: true, uniqueness: true
	validates :short_code, presence: true, uniqueness: true
end
