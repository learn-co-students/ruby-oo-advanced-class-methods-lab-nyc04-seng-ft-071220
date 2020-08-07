require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name_arg)
    new_song_with_name = Song.new
    new_song_with_name.name = name_arg
    new_song_with_name
  end

  #takes in the string name of a song
  #returns a song instance w/ name set as name property && song saved into @@all
  def self.create_by_name(name_arg)
    a_song = Song.new
    a_song.name = name_arg
    @@all << a_song
    a_song
    #binding.pry
  end

  #accepts the string name of a song
  #returns the matching instance of the song with that name
  def self.find_by_name(name_arg)
    self.all.find do |song|
      song.name == name_arg
    end
  end

  #prevent duplicate songs being created that actually represent the same song
  #accept a string name for a song
  #either return a matching song instance with that name 
  #or create a new song with the name and return the song instance
  def self.find_or_create_by_name(name_arg)
    if self.find_by_name(name_arg)
      self.find_by_name(name_arg)
    else
      self.create_by_name(name_arg)
    end
  end

  #returns all the songs in ascending (a-z) alphabetical order
  def self.alphabetical
    self.all.sort_by(&:name)
  end

  #accepts a filename in the format of "Taylor Swift - Blank Space.mp3"
  #should return a new Song instance with the song name 
  #set to Blank Space and the artist_name set to Taylor Swift
  #must be parsed for the relevant components
    #Separate the artist name from the rest of the data based on the - delimiter. 
    #Don't forget you have to remove the '.mp3' part of the string
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  #should not only parse the filename correctly but 
  #should also save the Song instance that was created
  def self.create_from_filename(filename)
    filename_song = self.new_from_filename(filename)
    @@all << filename_song
  end

  #should reset the state of the @@all class variable 
  #to an empty array thereby deleting all previous song instances.
  def self.destroy_all
    @@all.clear
  end

end
