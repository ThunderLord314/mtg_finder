class CreateCardexpansions < ActiveRecord::Migration[5.2]
  def change
    create_table :cardexpansions do |t|
      t.references :Card, foreign_key: true
      t.references :Expansion, foreign_key: true

      t.timestamps
    end
  end
end
