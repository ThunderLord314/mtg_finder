class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
    	t.string 	:name, null: false
    	t.string 	:artist, null: false
    	t.integer 	:cmc, null: false
    	t.string 	:colors
    	t.string	:image
    	t.string 	:layout
    	t.string 	:mana_cost, null: false
    	t.integer 	:power
    	t.string 	:expansions, null: false
    	t.string 	:rarity, null: false
        t.string    :toughness
    	t.string 	:types, null: false

      	t.timestamps
    end
  end
end
