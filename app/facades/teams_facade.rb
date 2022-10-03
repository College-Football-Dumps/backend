class TeamsFacade
  class << self
    def advanced_stat_search(year)
      teams = TeamsService.get_teams_data(year)
    end
  end
end