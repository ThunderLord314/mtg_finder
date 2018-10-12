class CreateCardtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :cardtypes do |t|
      t.references :Card, foreign_key: true
      t.references :Type, foreign_key: true

      t.timestamps
    end
  end
end
