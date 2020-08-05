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
    @@all << song
    song
  end

  def self.new_by_name(new_song)
    song = Song.new
    song.name = new_song
    song
  end

  def self.create_by_name(new_song)
    song = Song.new
    song.name = new_song
    @@all << song
    song
  end

  def self.find_by_name(new_song)
    @@all.find{|song|song.name  == new_song}
  end

    def self.find_or_create_by_name(new_song)
      if self.find_by_name(new_song)
        self.find_by_name(new_song)
      else 
        self.create_by_name(new_song)
      end
    end

    def self.alphabetical
      self.all.sort_by{|song|song.name}
    end

    def self.new_from_filename(filename)
      song = self.create
      song.artist_name = filename.split(/[-.]/)[0].strip
      song.name = filename.split(/[-.]/)[1].strip
      song
      # binding.pry
    end


    #it's there a better way to do this one, more concise?
    def self.create_from_filename(filename)
      song = self.create
      song.artist_name = filename.split(/[-.]/)[0].strip
      song.name = filename.split(/[-.]/)[1].strip
      @@all << song
      song
    end

    def self.destroy_all
      @@all.clear
    end

end
