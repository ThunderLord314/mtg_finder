class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image_name, null: false
      t.string :path, null: false

      t.timestamps
    end
  end
end
