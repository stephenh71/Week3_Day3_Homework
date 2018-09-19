require('pry')
require_relative('../models/album')
require_relative('../models/artist')

artist1 = Artists.new({"name" => "The Jam"})
artist2 = Artists.new({"name" => "Style Council"})

artist1.save()
artist2.save()

album1 = Albums.new({
  "title" => "In the City",
  "genre" => "Mod",
  "artist_id" => artist1.id
})

album2 = Albums.new({
  "title" => "All Mod Cons",
  "genre" => "Mod",
  "artist_id" => artist1.id
})

album3 = Albums.new({
  "title" => "Cafe Bleu",
  "genre" => "New Wave",
  "artist_id" => artist2.id
})

album4 = Albums.new({
  "title" => "Confessions of a Pop Group",
  "genre" => "New Wave",
  "artist_id" => artist2.id
})

album1.save()
album2.save()
album3.save()
album4.save()

binding.pry
nil
