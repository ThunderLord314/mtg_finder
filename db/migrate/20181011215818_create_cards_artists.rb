class CreateCardsArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :cards_artists do |t|
      t.references :cards, foreign_key: true
      t.references :artists, foreign_key: true

      t.timestamps
    end
  end
end
