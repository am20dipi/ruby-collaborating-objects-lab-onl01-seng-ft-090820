
class Artist
  attr_accessor :name  
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
    
  def self.all
    @@all
  end
  
  def songs
    Song.all.select{|song| song.artist == self}
  end
  
  def self.find_or_create_by_name(name)
    if artist = @@all.find {|artist| artist.name == name}
    else
      artist = Artist.new(name)
    end
    artist
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
  
  
end
  
  