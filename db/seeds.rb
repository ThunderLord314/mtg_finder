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
	# Create an expansion in the database for each record in the JSON data
	puts "EXPANSION: #{input[1]["name"]}"
	expansion = Expansion.create(	expansion_name: input[1]["name"],
									short_code: input[1]["code"],
									release_date: input[1]["releaseDate"],
									border: input[1]["border"]
								)
	# Loop through all of the cards in an expansion and add them to the database
	input[1]["cards"].each do |card_in|
		# Creates a new card if one does not exist; otherwise update the artist and expansion
		puts "Creating Card: #{card_in["name"]}"
		card = Card.create_with(
						artist: card_in['artist'],
						cmc: card_in['cmc'],
						colors: card_in['colors'],
						layout: card_in['layout'],
						mana_cost: card_in['manaCost'],
						power: card_in['power'],
						expansion: expansion.expansion_name,
						rarity: card_in['rarity'],
						text: card_in['text'],
						toughness: card_in['toughness'],
						all_type: card_in['type'],
						).find_or_create_by(name: card_in['name'])

		# Creates an artist if it does not exist; I do not use the found entry from the find
		Artist.find_or_create_by(artist_name: card_in['artist'])
		# Go through each of the subtypes and add them to the database if they do not exist
		# Types and supertypes will be hard-coded, as I don't expect new entries
		if !card_in['subtypes'].nil?
			card_in['subtypes'].each do |type|
				Type.create_with(category: "subtype").find_or_create_by(type_name: type)
			end
		end
	end
end
# Add type and supertypes here

puts "Seed Complete."