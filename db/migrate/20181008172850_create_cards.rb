class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
    	t.string 	:name
    	t.string 	:artist
    	t.integer 	:cmc
    	t.string 	:colors
    	t.string	:image
    	t.string 	:layout
    	t.string 	:mana_cost
    	t.integer 	:power
    	t.string 	:expansions
    	t.string 	:rarity
    	t.string 	:types

      	t.timestamps
    end
  end
end
