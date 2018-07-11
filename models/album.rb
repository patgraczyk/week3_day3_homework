require('pg')
require_relative('../db/sql_runner')

class Album

attr_accessor :artist_id

def initialize(options)
  @artists_id = options['artist_id'].to_i
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @genre = options['genere']
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



# def save()
#    sql = "INSERT INTO pizza_orders
#    (
#      customer_id,
#      topping,
#      quantity
#    ) VALUES
#    (
#      $1, $2, $3
#    )
#    RETURNING id"
#    values = [@customer_id, @topping, @quantity]
#    pizza_orders = SqlRunner.run(sql,values)
#    @id = pizza_orders[0]["id"].to_i
#  end


end  #end of class
