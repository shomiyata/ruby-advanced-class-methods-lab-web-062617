require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    self.new.save.last
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(title, artist=nil)
    song = self.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_by_name(title, artist=nil)
    song = self.create
    song.name = title
    song.artist_name = artist
    song
  end

  def self.find_by_name(title)
    self.all.find { |song| song.name == title }
  end

  def self.find_or_create_by_name(title)
    if self.all.find { |song| song.name == title } == nil
      self.create_by_name(title)
    else
      self.all.find { |song| song.name == title }
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(mp3)
    mp3_parse = mp3.split(" - ")
    self.new_by_name(mp3_parse[1].chomp(".mp3"), mp3_parse[0])
  end

  def self.create_from_filename(mp3)
    mp3_parse = mp3.split(" - ")
    self.create_by_name(mp3_parse[1].chomp(".mp3"), mp3_parse[0])
  end

  def self.destroy_all
    @@all.clear
  end

end
