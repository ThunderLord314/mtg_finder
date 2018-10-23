class CreateCardexpansions < ActiveRecord::Migration[5.2]
  def change
    create_table :cardexpansions do |t|
      t.references :card, foreign_key: true
      t.references :expansion, foreign_key: true

      t.timestamps
    end
  end
end
