class Cardartist < ApplicationRecord
  belongs_to :card
  belongs_to :artist
end
