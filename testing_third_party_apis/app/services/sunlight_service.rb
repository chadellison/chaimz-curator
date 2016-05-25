class SunlightService
  def initialize
    @_conn = Faraday.new(url: "http://congress.api.sunlightfoundation.com")
  end

  def legislators(params)
    results(params)
  end

  private
    def results(params)
      JSON.parse(response(params).body, symbolize_names: true)[:results]
    end

    def response(params)
      conn.get "/legislators", params.merge(apikey: ENV["SUNLIGHT_API_KEY"])
    end

    def conn
      @_conn
    end
end
