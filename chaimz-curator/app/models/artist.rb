class Artist < OpenStruct
  def self.service
    ChaimzService.new
  end

  def self.find(id)
    temp_artists_hash = service.artist_hash(id)
    Artist.new(temp_artists_hash)
  end

  def self.all
    temp_artists_hash = service.artists_hash
    temp_artists_hash.map do |temp_artists_hash|
      Artist.new(temp_artists_hash)
    end
  end
end
