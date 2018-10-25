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
	Type.destroy_all
	puts "Types Cleared"
	Expansion.destroy_all
	puts "Expansions Cleared."
	Card.destroy_all
	puts "Cards Cleared."
end
expansion_file = File.read(File.join(current_path, json_path, expansion_file_location))
expansion_hash = JSON.parse(expansion_file)

# Create hard-coded types and supertypes; these will likely not change
Type.create(type_name: "Creature", category: "type")
Type.create(type_name: "Artifact", category: "type")
Type.create(type_name: "Enchantment", category: "type")
Type.create(type_name: "Land", category: "type")
Type.create(type_name: "Planeswalker", category: "type")
Type.create(type_name: "Instant", category: "type")
Type.create(type_name: "Sorcery", category: "type")
Type.create(type_name: "Tribal", category: "type")
Type.create(type_name: "Conspiracy", category: "type")
Type.create(type_name: "Phenomenon", category: "type")
Type.create(type_name: "Plane", category: "type")
Type.create(type_name: "Scheme", category: "type")
Type.create(type_name: "Vanguard", category: "type")

Type.create(type_name: "Basic", category: "supertype")
Type.create(type_name: "Legendary", category: "supertype")
Type.create(type_name: "Ongoing", category: "supertype")
Type.create(type_name: "Snow", category: "supertype")
Type.create(type_name: "World", category: "supertype")

expansion_count = expansion_hash.size
current_expac_count = 0
current_card_count = 0
current_card_set_count = 0

expansion_hash.each do |input|
	# Create an expansion in the database for each record in the JSON data
	puts "/ / / / / / / / / / / /"
	puts "EXPANSION #{current_expac_count} out of #{expansion_count}"
	puts "/ / / / / / / / / / / /"
	current_expac_count += 1
	expansion = Expansion.create(	expansion_name: input[1]["name"],
									short_code: input[1]["code"],
									release_date: input[1]["releaseDate"],
									border: input[1]["border"]
								)

	card_count = input[1]["cards"].size
	current_card_set_count = 0

	# Loop through all of the cards in an expansion and add them to the database
	input[1]["cards"].each do |card_in|
		# Creates a new card if one does not exist
		puts "Card #{current_card_set_count} out of #{card_count} (#{current_card_count})"
		current_card_count += 1
		current_card_set_count += 1
		new_card = Card.find_or_create_by!(name: card_in['name']) do |card|
			card.artist = card_in['artist']
			card.cmc = card_in['cmc']
			card.colors = card_in['colors']
			card.layout = card_in['layout']
			card.mana_cost = card_in['manaCost']
			card.power = card_in['power']
			card.expansion = expansion.expansion_name
			card.rarity = card_in['rarity']
			card.text = card_in['text']
			card.toughness = card_in['toughness']
			card.all_type = card_in['type']
			card.image = card_in['imageName']
			card.save
		end
		# Link the expansion and cards
		expansion.cards << new_card

		# Creates an artist if it does not exist; I do not use the found entry from the find
		artist = Artist.find_or_create_by(artist_name: card_in['artist'])

		# Link the artist to the card
		new_card.artists << artist

		# Go through each of the subtypes and add them to the database if they do not exist
		if !card_in['subtypes'].nil?
			card_in['subtypes'].each do |type|
				Type.create_with(category: "subtype").find_or_create_by(type_name: type)
			end
		end

		# Link the card to its types
		type_list = new_card.all_type.delete("—").split(" ")
		type_list.each do |t|
			found_type = Type.where("type_name = ?", t)
			new_card.types << found_type
		end

		abs_path = "C:\vagrant-rails\Rails\mtg_finder\app\assets\images"

		# Add the image name to the database
		new_image = Image.create(path: abs_path + card_in['imageName'].delete(" ") + ".png", image_name: card_in['imageName'])
	end
end

puts "Seed Complete."