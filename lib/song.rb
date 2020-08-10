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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    # song = Song.new_by_name(title)
    song = self.new_by_name(title)
    song.save
    song
  end

  def self.find_by_name(title)
    # Song.all.find do |song| 
    self.all.find do |song| 
      song.name == title 
    end
  end

  def self.find_or_create_by_name(title)
    # found = Song.find_by_name(title)
    # found ? found : Song.create_by_name(title)
    found = self.find_by_name(title)
    found ? found : self.create_by_name(title)
  end

  def self.alphabetical
    # Song.all.sort_by do |song|
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    splitname = filename.delete_suffix(".mp3").split(" - ")
    # song = Song.create
    song = self.create
    song.name = splitname[1]
    song.artist_name = splitname[0]
    song
  end
  

  def self.create_from_filename(filename)
    # song = Song.new_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    # Song.all.clear
    self.all.clear
  end


end
