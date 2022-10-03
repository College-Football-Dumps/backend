class TeamsService
  class << self
    def get_teams_data(year)
      response = connection.get("/stats/season/advanced?year=#{year}")
      parse_data(response)
    end

  private
    def connection
      Faraday.new(url: "https://api.collegefootballdata.com") do |faraday|
        faraday.headers['Authorization'] = "Bearer #{ENV['football_key']}"
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end