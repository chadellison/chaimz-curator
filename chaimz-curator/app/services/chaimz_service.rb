class ChaimzService
  def initialize
    @connection = Faraday.new(url: "https://my-chaimz.herokuapp.com/api/v1/")
    @connection.headers["Authorization"] = "Bearer 35148ad62db32ff044d6df2cd57"
  end

  def get_artists
    @connection.get "artists"
  end

  def get_artist(id)
    @connection.get "artists/#{id}"
  end

  def artists_hash
    parse(get_artists)
  end

  def artist_hash(id)
    parse(get_artist(id))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
