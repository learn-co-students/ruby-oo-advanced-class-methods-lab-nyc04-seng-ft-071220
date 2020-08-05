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
    song = self.new #creates new instance of Song class
    song.save #instance calls .save method to enable pushing new instance into @@all
    song #have to remember to return instance to be assignable to a variable
  end

  def self.new_by_name(song_name)
    song = self.new #creates new instance of Song class, at this point the instance has no attributes.
    song.name = song_name #takes song_name argument and assign it to song.name isntance attribute.
    song #returns instance with attribute added
  end

  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name 
    song.save 
    song 
  end

  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    !self.find_by_name(song_name) ? self.create_by_name(song_name) : self.find_by_name(song_name)
  end

  def self.alphabetical 
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song = self.new_by_name(filename)
    data_array = song.name.split("-")
    song.artist_name = data_array[0].strip
    song.name = data_array[1].split(".")[0].strip
    song
    # binding.pry
  end

  def self.create_from_filename(filename)
    song = self.find_or_create_by_name(filename)
    data_array = song.name.split("-")
    song.artist_name = data_array[0].strip
    song.name = data_array[1].split(".")[0].strip
    song
  end

  def self.destroy_all
    Song.all.clear
  end



end
