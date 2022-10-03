module Api
  module V1
    class TeamsController < ApplicationController
      def index
        teams = TeamsFacade.advanced_stat_search(params[:year])
        # top_15 = search_criterion(teams)
        render json: TeamsSerializer.new(teams)
      end

    # private
    #   def search_criterion(teams)
    #     if !params[:overall].nil?
    #       teams.sort_by{|team|team.total_havoc}.reverse!.slice!(0..14)
    #     elsif !params[:dl].nil?
    #       teams.sort_by{|team|team.defensive_line_havoc}.reverse!.slice!(0..14)
    #     elsif !params[:db].nil?
    #       teams.sort_by{|team|team.db_havoc}.reverse!.slice!(0..14)
    #     else
    #       #error
    #     end
    end
  end
end
