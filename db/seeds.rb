# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

expansion_file_location = "expansions.json"
json_path = "/app/assets/json/"
current_path = "/vagrant/rails/mtg_finder"
reset_data = false # Set to true to clear the tables when updating

if reset_data
	Expansion.destroy_all
	puts "Expansions Cleared."
	Card.destroy_all
	puts "Cards Cleared."
end
expansion_file = File.read(File.join(current_path, json_path, expansion_file_location))
expansion_hash = JSON.parse(expansion_file)
expansion_hash.each do |input|
	expansion = Expansion.where(expansion_name: input[1]["name"])
	# Create an expansion in the database for each record in the JSON data
	expansion = Expansion.create(	expansion_name: input[1]["name"],
									short_code: input[1]["code"],
									release_date: input[1]["releaseDate"],
									border: input[1]["border"]
								)
	# Loop through all of the cards in an expansion and add them to the database
	input[1]["cards"].each do |card_in|
		# If the card is in the database, update it instead of creating a new entry
		update_card = Card.where(name: card_in['name'])
		if update_card.name == "Card"
			puts "Creating Card: #{card_in["name"]}"
			Card.create(	name: card_in['name'],
							artist: card_in['artist'],
							cmc: card_in['cmc'],
							colors: card_in['colors'],
							layout: card_in['layout'],
							mana_cost: card_in['manaCost'],
							power: card_in['power'],
							expansions: expansion.expansion_name,
							rarity: card_in['rarity'],
							text: card_in['text'],
							toughness: card_in['toughness'],
							types: card_in['type'],
						)
		else
			puts "Updating: #{update_card.name}"
			# Don't duplicate already existing entries
		end
	end
end

puts "Seed Complete."