class CreateCardsExpansions < ActiveRecord::Migration[5.2]
  def change
    create_table :cards_expansions do |t|
      t.references :cards, foreign_key: true
      t.references :expansions, foreign_key: true

      t.timestamps
    end
  end
end
