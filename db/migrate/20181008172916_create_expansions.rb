class CreateExpansions < ActiveRecord::Migration[5.2]
  def change
    create_table :expansions do |t|
    	t.string 	:expansion_name, null: false
    	t.string 	:short_code, null: false
    	t.datetime 	:release_date, null: false
    	t.string	:border, null: false

      	t.timestamps
    end
  end
end
