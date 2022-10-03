module Api
  module V1
    class TeamsController < ApplicationController
      before_action :check_valid_year
      def index
        # teams = TeamsFacade.advanced_stat_search(params[:year])
        # top_15 = search_criterion(teams)
        render json: TeamsSerializer.new(teams)
      end

      private
        def check_valid_year
          if !params[:year].nil?
            teams = TeamsFacade.advanced_stat_search(params[:year])
          else
            render json: "Please enter a year between 2016-2022", status: 404
          end
        end

    #   def search_criterion(teams)
    #     if !params[:overall].nil?
    #       teams.sort_by{|team|team.total_havoc}.reverse!.slice!(0..14)
    #     elsif !params[:dl].nil?
    #       teams.sort_by{|team|team.defensive_line_havoc}.reverse!.slice!(0..14)
    #     elsif !params[:db].nil?
    #       teams.sort_by{|team|team.db_havoc}.reverse!.slice!(0..14)
    #     else
    #       #error
      end
    end
  end
end
