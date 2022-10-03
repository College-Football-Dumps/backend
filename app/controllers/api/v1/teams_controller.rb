module Api
  module V1
    class TeamsController < ApplicationController
      def index
        teams = TeamsFacade.advanced_stat_search(params[:year])
        # render_restaurants(results)
      end
    end
  end
end
