class CardsArtist < ApplicationRecord
  belongs_to :cards
  belongs_to :artists
end
