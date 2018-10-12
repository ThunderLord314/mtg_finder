class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
    	t.string 	:name, null: false, unique: true
    	t.string 	:artist, null: false
    	t.integer 	:cmc
    	t.string 	:colors
    	t.string	:image, null: false
    	t.string 	:layout
    	t.string 	:mana_cost
    	t.integer 	:power
    	t.string 	:expansions, null: false
    	t.string 	:rarity
        t.string    :text
        t.integer   :toughness
    	t.string 	:types

      	t.timestamps
    end
  end
end
