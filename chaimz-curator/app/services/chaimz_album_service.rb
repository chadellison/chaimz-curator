class ChaimzAlbumService
  def initialize
    @connection = Faraday.new(url: "https://my-chaimz.herokuapp.com/api/v1/")
    @connection.headers["Authorization"] = "Bearer 35148ad62db32ff044d6df2cd57"
  end

  def get_albums
    @connection.get "albums"
  end

  def get_album(id)
    @connection.get "albums/#{id}"
  end

  def albums_hash
    parse(get_albums)
  end

  def album_hash(id)
    parse(get_album(id))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end


# All Albums: GET 'api/v1/albums'
# Song: GET 'api/v1/albums/:id'
# Update Album Info: PATCH 'api/v1/albums/:id?title:Album title&year=1999' with params: {title: "Album title", year: "1999"}
# Create New Album: POST 'api/v1/albums?title:Album title&year=1999' with params: {title: "Album title", year: "1999"}
