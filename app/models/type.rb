class Type < ApplicationRecord
	has_many :cards, through: :cards_types

	validates :type_name, presence: true, unique: true
	validates :category presence: true
end
