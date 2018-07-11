require('pry')
require_relative('../models/album')
require_relative('../models/artist')


artist1 = Artist.new('name' => 'Wendy Williams')
artist1.save()
