class TeamsSerializer
  class << self
    def new(teams)
      {
        data: {
          id: nil,
          type: 'teams',
          attributes: teams
        }
      }
    end
  end
end
