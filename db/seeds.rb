User.all do |user|
	user.is_admin = "true"
	user.is_merchant = "true"
	user.save
end

#Merchant.delete_all

#Merchant.create(name: "Crema Cafe", address: "27 Brattle St", city: "Cambridge", state: "MA", zip_code: "02138", current_song_id: rand(1..12), previous_song_id: rand(1..12))
#Merchant.create(name: "Buffalo Exchange", address: "238 Elm St", city: "Somerville", state: "MA", zip_code: "02144", current_song_id: rand(1..12), previous_song_id: rand(1..12))
#Merchant.create(name: "Cafe 1369", address: "1369 Cambridge St", city: "Cambridge", state: "MA", zip_code: "02139", current_song_id: rand(1..12), previous_song_id: rand(1..12))
#Merchant.create(name: "MetroRock", address: "69 Norman St", city: "Everett", state: "MA", zip_code: "02149", current_song_id: rand(1..12), previous_song_id: rand(1..12))
#Merchant.create(name: "Saloon", address: "255 Elm St", city: "Somerville", state: "MA", zip_code: "02144", current_song_id: rand(1..12), previous_song_id: rand(1..12))
#Merchant.create(name: "Boloco", address: "284 Congress St", city: "Boston", state: "MA", zip_code: "02210", current_song_id: rand(1..12), previous_song_id: rand(1..12))

#Merchant.all do |merchant|

#	merchant.current_song_id = rand(1..12)
#	merchant.previous_song_id = rand (1..12)
#	Song.find_by_id(merchant.current_song_id).current_merchants << merchant
#	Song.find_by_id(merchant.previous_song_id).previous_merchants << merchant
#end

#Song.create(title: "Esmerelda", artist: "Ben Howard", album: "The Burgh Island EP")
#Song.create(title: "Reckoner", artist: "Radiohead", album: "In Rainbows")
#Song.create(title: "Time", artist: "Pink Floyd", album: "Dark Side Of The Moon")
#Song.create(title: "I Turn My Camera On", artist: "Spoon", album: "Gimme Fiction")
#Song.create(title: "Spanish Sahara", artist: "Foals", album: "Total Life Forever")
#Song.create(title: "Myth", artist: "Beach House", album: "Bloom")
#Song.create(title: "Dani California", artist: "Red Hot Chili Peppers", album: "Stadium Arcadium")
#Song.create(title: "Future Reflections", artist: "MGMT", album: "Oracular Spectacular")
#Song.create(title: "L.E.S. Artistes", artist: "Santigold", album: "Santigold")
#Song.create(title: "Ulysses", artist: "Franz Ferdinand", album: "Tonight")
#Song.create(title: "Idaho", artist: "Josh Ritter", album: "The Animal Years")
#Song.create(title: "All These Things That I've Done", artist: "The Killers", album: "Hot Fuss")



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
