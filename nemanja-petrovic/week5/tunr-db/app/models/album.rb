class Album < ApplicationRecord
  has_many :songs
  has_many :artists, through: 'songs'

  def artist
    self.artists.first
  end
end
