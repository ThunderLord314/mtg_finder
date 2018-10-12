class CreateCardartists < ActiveRecord::Migration[5.2]
  def change
    create_table :cardartists do |t|
      t.references :Card, foreign_key: true
      t.references :Artist, foreign_key: true

      t.timestamps
    end
  end
end
