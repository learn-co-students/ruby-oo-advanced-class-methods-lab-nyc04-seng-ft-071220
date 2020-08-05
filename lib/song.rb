class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # Build a class constructor Song.create that initializes a song and saves it to the @@all class variable 
  # either literally or through the class method Song.all. 
  # This method should return the song instance that was initialized and saved

  def self.create
    song = Song.new
    song.save
    song
  end

  # Build a class constructor Song.new_by_name that takes in the string name of a song 
  # and returns a song instance with that name set as its name property. 
  # Song.new_by_name should return an instance of Song and not a simple string or anything else. 
  # Implement the following functionality:

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  # Build a class constructor Song.create_by_name that takes in the string name of a song 
  # and returns a song instance with that name set as its name property and the song 
  # being saved into the @@all class variable.

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  # Build a class finder Song.find_by_name that accepts the string name of a song and 
  # returns the matching instance of the song with that name. Consider:

  def self.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end

  # In order to prevent duplicate songs being created that actually represent the same song (based on the song name), 
  # we're going to build a Song.find_or_create_by_name class method. 
  # This method will accept a string name for a song and either return a matching song instance 
  # with that name or create a new song with the name and return the song instance.

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  # Build a class method Song.alphabetical that returns all the songs 
  # in ascending (a-z) alphabetical order.
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  # Build a class constructor that accepts a filename in the format of " - .mp3", 
  # for example, "Taylor Swift - Blank Space.mp3".

  # Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"), 
  # the constructor should return a new Song instance with the song name set to 
  # Blank Space and the artist_name set to Taylor Swift. 
  # The filename input sent to Song.new_from_filename in the format of 
  # Taylor Swift - Blank Space.mp3 must be parsed for the relevant components. 
  # Separate the artist name from the rest of the data based on the - delimiter. 
  # Don't forget that when you parse the song name, you have to remove the '.mp3' part of the string.

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  # Build a class constructor that accepts a filename in the format of " - .mp3", 
  # for example "Taylor Swift - Blank Space.mp3". 
  # The Song.create_from_filename class method should not only parse the filename correctly 
  # but should also save the Song instance that was created.
  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  # The Song.destroy_all class method should reset the state of the @@all class variable 
  # to an empty array thereby deleting all previous song instances.

  def self.destroy_all
    self.all.clear
  end

end
