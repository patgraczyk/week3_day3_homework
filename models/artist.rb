require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_accessor :name

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
end


def save()
  sql = "INSERT INTO artists (name)
  VALUES ($1)
  RETURNING id"
  values = [@name]
  artists = SqlRunner.run(sql,values)
  @id = artists[0]["id"].to_i
end

def self.all()
  sql = "SELECT * FROM artists"
  artists = SqlRunner.run(sql)
  return artists.map { |artists_hash| Artist.new(artists_hash) }
end

def self.find(id)
  sql = "SELECT * FROM artists WHERE id = $1"
  values = [id]
  artists= SqlRunner.run(sql,values)
  artist = Artist.new(artist.first)
  return artist
end

def update()
  sql = "UPDATE artists SET
  name = $1
  WHERE id = $2"
  values = [@name, @id]
  SqlRunner.run(sql, values)
end



end  #end of class
