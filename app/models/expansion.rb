class Expansion < ApplicationRecord
	has_many :cardexpansions
	has_many :cards, through: :cardexpansions

	validates :expansion_name, presence: true, uniqueness: true
	validates :short_code, presence: true, uniqueness: true
end
