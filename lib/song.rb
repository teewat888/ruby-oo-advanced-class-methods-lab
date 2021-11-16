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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if !song
     return self.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    self.all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    portion = filename.split(".")
    info  = portion[0].split(" - ")
    artist = info[0]
    song_name = info[1]
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
   end

   def self.create_from_filename(filename)
    self.new_from_filename(filename).save
   end

   def self.destroy_all
    self.all.clear
   end

end

Song.new_from_filename("My artist - song name.mp3")

