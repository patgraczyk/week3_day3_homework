require('pry')
require_relative('../models/album')
require_relative('../models/artist')


artist1 = Artist.new('name' => 'Wendy Williams')
artist2 = Artist.new('name' => 'Moira Stuart')
artist1.save()
artist2.save()


album1 = Album.new('title' => 'Wendy Sings', 'genre' => 'rock')
album1.save()
album2 = Album.new('title' => 'Moira Sings', 'genre' => 'swing')
album2.save()

p Artist.all()

p Album.all()


artist1.name = 'Moira Banks'
artist1.update()
