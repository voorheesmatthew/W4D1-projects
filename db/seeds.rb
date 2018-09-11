# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

potterman = User.create(username: 'potterman')
dobbycreature = User.create(username: 'dobbycreature')
notherm = User.create(username: 'notherm')

potter_art = Artwork.create(title: 'lightning', image_url: 'lightning.com', artist_id: potterman.id)
dobby_art = Artwork.create(title: 'sock', image_url: 'sock.com', artist_id: dobbycreature.id)
herm_art = Artwork.create(title: 'book', image_url: 'book.com', artist_id: notherm.id)

# herm viewed harrys art 
ArtworkShare.create(artwork_id: potter_art.id, viewer_id: notherm.id)
# dobby viewed herms art
ArtworkShare.create(artwork_id: herm_art.id, viewer_id: dobbycreature.id)