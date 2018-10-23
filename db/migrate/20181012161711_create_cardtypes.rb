class CreateCardtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :cardtypes do |t|
      t.references :card, foreign_key: true
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
