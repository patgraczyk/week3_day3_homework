require ('pg')
require_relative('../db/sql_runner')
require_relative('../db/artist')


class Album

def initialize(options)
  @artists_id = options['artist_id'].to_i
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @genre = options['genere']
end




end  #end of class
