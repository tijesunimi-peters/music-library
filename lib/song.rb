class Song
  attr_accessor :name
  attr_reader :artist, :genre
  include Concerns

  def initialize(name, artist_object = nil, genre_object = nil)
    @name = name
    self.artist = artist_object unless artist_object.nil?
    self.genre = genre_object unless genre_object.nil?
  end

  def artist=(artist_object)
    @artist = artist_object
    add_song_to_artist
  end

  def genre=(genre_object)
    @genre = genre_object
    add_song_to_genre
    add_to_artist_genre if @artist
    add_to_genre_artist
  end

  def add_song_to_artist
    artist.add_song(self)
  end

  def add_song_to_genre
    genre.add_song(self)
  end

  def add_to_artist_genre
    artist.add_genre(genre)
  end

  def add_to_genre_artist
    genre.add_artist(artist)
  end

  def self.all
    @@all ||= []
  end
end
