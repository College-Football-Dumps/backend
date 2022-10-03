module Api
  module V1
    class TeamsController < ApplicationController
      def index
        teams = TeamsFacade.advanced_stat_search(params[:year])
        search_criterion(teams)
      end

    private
      def search_criterion(teams)
        if !params[:overall].nil?
          top_15 = teams.sort_by{|team|team.total_havoc}.reverse!.slice!(0..24)
        elsif !params[:defensive_line].nil?
          #top_15_defensive_line
        elsif !params[:db].nil?
          #top_15_dbs
        else
          #error
        end
      end
    end
  end
end
