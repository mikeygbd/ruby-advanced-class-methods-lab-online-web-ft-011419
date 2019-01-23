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
    song = Song.new
  # binding.pry
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    return song
  end

    def self.find_by_name(name)
      @@all.find do |song|
          song.name == name
      end
    end

    def Song.find_or_create_by_name(name)
       self.find_by_name(name) || self.create_by_name(name)
    end


    def self.alphabetical
      # binding.pry
    self.all.sort_by {|i| i.name}
    end

    def self.new_from_filename(filename)
      song = Song.new
      split = filename.split(' - ')
      song_name = split[1].split('.')[0]
      song.name = song_name
      song.artist_name = split[0]
       song
    end

    def self.create_from_filename(filename)

      self.new_from_filename(filename).save
    end

    def self.destroy_all
      @@all.clear
    end
end
