module API
  module V1
    class Leaderboards < Grape::API
    	include API::V1::Defaults
    	resource :leaderboards do
    	  desc "Return all leaderboards"
    	  get "", root: :leaderboards do
    	    Leaderboard.all
    	  end

    	  desc "Return an leaderboard"
    	  params do
    	    requires :id, type: String, desc: "ID of the leaderboard"
    	  end
    	  get ":id", root: "leaderboard" do
    	    Leaderboard.where(id: permitted_params[:id]).first!
    	  end
    	  
    	  desc "create a new leaderboard"
    	  ## This takes care of parameter validation
    	  params do
    	    group :leaderboard, type: Hash do
    	      optional :leaderboard_name, type: String
    	      optional :game_id, type:Integer
              optional :icon, type: String
              optional :desc, type: String
              optional :list_order, type:Integer
              optional :limit, type: Boolean
              optional :score_formatting, type: String
              optional :type, type: String
              optional :time_frame, type: String
              optional :ordering, type: String
    	    end  
    	  end
    	  ## This takes care of creating leaderboard
    	  post do
    	    Leaderboard.new(params[:leaderboard]).save!
    	  end 

    	  desc "delete an leaderboard"
    	  ## This takes care of parameter validation
    	  params do
    	    requires :id, type:String, desc: "ID of the leaderboard"
    	  end
    	  ## This takes care of deleting leaderboard
    	  delete ":id" do
    	    Leaderboard.find(params[:id]).destroy!  
    	  end  

    	  desc "update an leaderboard"
    	  ## This takes care of parameter validation
    	  params do
    	    group :leaderboard, type: Hash do
    	      optional :leaderboard_name, type: String
              optional :game_id, type:Integer
              optional :icon, type: String
              optional :desc, type: String
              optional :list_order, type:Integer
              optional :limit, type: Boolean
              optional :score_formatting, type: String
              optional :type, type: String
              optional :time_frame, type: String
              optional :ordering, type: String
    	    end  
    	  end
    	  ## This takes care of editing leaderboard
    	  put ":id" do
    	    Leaderboard.find(params[:id]).update_attributes(params[:leaderboard])
    	  end 

    	end	
    end
  end
end
