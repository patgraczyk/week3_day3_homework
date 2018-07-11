require('pg')
require_relative('../db/sql_runner')

class Artist

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

end  #end of class
