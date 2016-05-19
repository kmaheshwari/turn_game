module API
  module V1
    class Games < Grape::API
    	include API::V1::Defaults
    	resource :games do
    	  desc "Return all games"
    	  get "", root: :games do
    	    Game.all
    	  end

    	  desc "Return an game"
    	  params do
    	    requires :id, type: String, desc: "ID of the game"
    	  end
    	  get ":id", root: "game" do
    	    Game.where(id: permitted_params[:id]).first!
    	  end
    	  
    	  desc "create a new game"
    	  ## This takes care of parameter validation
    	  params do
    	    group :game, type: Hash do
    	      optional :game_name, type: String
    	      optional :playstore_url_id, type:Integer
    	    end  
    	  end
    	  ## This takes care of creating game
    	  post do
    	    Game.new(params[:game]).save!
    	  end 

    	  desc "delete an game"
    	  ## This takes care of parameter validation
    	  params do
    	    requires :id, type:String, desc: "ID of the game"
    	  end
    	  ## This takes care of deleting game
    	  delete ":id" do
    	    Game.find(params[:id]).destroy!  
    	  end  

    	  desc "update an game"
    	  ## This takes care of parameter validation
    	  params do
    	    group :game, type: Hash do
    	      optional :game_name, type: String
    	      optional :playstore_url_id, type:Integer
    	   
    	    end  
    	  end
    	  ## This takes care of editing game
    	  put ":id" do
    	    Game.find(params[:id]).update_attributes(params[:game])
    	  end 

    	end	
    end
  end
end
