class CreateExpansions < ActiveRecord::Migration[5.2]
  def change
    create_table :expansions do |t|
    	t.string 	:expansion_name
    	t.string 	:short_code
    	t.datetime 	:release_date
    	t.string	:border

      	t.timestamps
    end
  end
end
