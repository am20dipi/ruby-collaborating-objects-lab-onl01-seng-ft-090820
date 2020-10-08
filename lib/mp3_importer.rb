class MP3Importer
  attr_accessor :filename, :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    @path = "./spec/fixtures/mp3s"
    Dir.entries(path).select {|file| file}
  end
  
  def import
    files.each do |file| 
      filename = file.gsub(".mp3", "") #.gsub removes the first item of the list and replaces it with the second.
      Song.new_by_filename(filename)
    end
  end
end