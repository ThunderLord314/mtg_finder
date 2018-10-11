class CreateCardsTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :cards_types do |t|
      t.references :cards, foreign_key: true
      t.references :types, foreign_key: true

      t.timestamps
    end
  end
end
