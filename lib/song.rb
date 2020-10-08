require 'pry'

class Song
  attr_accessor :name, :artist, :filename
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
  
  def artist
    @artist
  end
  
  
  def self.new_by_filename(filename)
    songinfo = filename.split(" - ")
    song = self.new(songinfo[1])
    song.artist_name = songinfo[0]
    song
  end
  
  def artist_name=(name)
    #binding.pry
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  
end