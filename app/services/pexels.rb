class Pexels
  def initialize
    options = {
      url: "https://api.pexels.com/v1",
      headers: {
        "Accept" => "application/json",
        "Authorization" => Figaro.env.pexels_api_key
      }
    }

    @conn = Faraday.new(options) do |builder|
      builder.response :json
      builder.response :logger
    end
  end

  def search(id)
    @conn.get("collections/#{id}").body
  end

  def photos(data)
    photo_entries = data["media"].select { |res| res["type"] == "Photo" }

    photo_entries.map { |entry| entry.slice("url", "src", "alt") }
  end
end
