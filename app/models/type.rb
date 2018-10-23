class Type < ApplicationRecord
	has_many :cardtypes
	has_many :cards, through: :cardtypes

	validates :type_name, presence: true, uniqueness: true
	validates :category, presence: true
end
