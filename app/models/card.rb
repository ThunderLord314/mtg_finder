class Card < ApplicationRecord
	has_and_belongs_to_many :expansions
	has_and_belongs_to_many :artists
	has_and_belongs_to_many :types
	has_many :images
end
