class Type < ApplicationRecord
	has_many :cards, through: :cards_types
end
