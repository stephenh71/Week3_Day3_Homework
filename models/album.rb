require ('pg')

class Albums

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save ()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.all()
      sql = "SELECT * FROM albums"
      albums = SqlRunner.run(sql)
      return albums.map { |album|Albums.new(album) }
    end

def artist
  sql = "SELECT * FROM artists where id = $1"
  values = [@artist_id]
  results = SqlRunner.run(sql, values)
  return Artists.new(results[0])
end

def update()
  sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4"
  values = [@title, @genre, @artist_id, @id]
  results = SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE FROM albums WHERE id = $1"
  values = [@id]
  results = SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM albums"
  SqlRunner.run(sql)
end

def self.find(id)
  sql = "SELECT * FROM albums WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  return Albums.new(results[0])
end

end
