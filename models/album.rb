require('pg')
require_relative('../db/sql_runner')

class Album

attr_accessor :id, :genre, :title


def initialize(options)
  @artists_id = options['artist_id'].to_i
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @genre = options['genre']
end

def save()
  sql = "INSERT INTO albums (artist_id, title, genre)
  VALUES ($1, $2, $3)
  RETURNING id"
  values = [@artist_id, @title, @genre]
  albums_list = SqlRunner.run(sql, values)
  @id = albums_list[0]["id"].to_i
end

def self.all()
  sql = "SELECT * FROM albums"
  albums = SqlRunner.run(sql)
  return albums.map { |albums_hash| Album.new(albums_hash) }
end


def self.find(id)
  sql = "SELECT * FROM albums WHERE id = $1"
  values = [id]
  albums= SqlRunner.run(sql,values)
  album = Album.new(albums.first)
  return album
end

def update()
  sql = "UPDATE albums SET
  title = $1
  WHERE id = $2"
  values = [@title, @id]
  SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE FROM albums where id = $1"
  values = [@id]
  SqlRunner.run(sql,values)
end

end  #end of class
