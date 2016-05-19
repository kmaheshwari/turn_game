module API
  module V1
    class Users < Grape::API
    	include API::V1::Defaults
    	resource :users do
    	  desc "Return all users"
    	  get "", root: :users do
    	    User.all
    	  end

    	  desc "Return an user"
    	  params do
    	    requires :id, type: String, desc: "ID of the user"
    	  end
    	  get ":id", root: "user" do
    	    User.where(id: permitted_params[:id]).first!
    	  end
    	  
    	  desc "create a new user"
    	  ## This takes care of parameter validation
    	  params do
    	    group :user, type: Hash do
    	      optional :name, type: String
    	      optional :uid, type: String
    	      optional :age, type:Integer
    	      optional :access_token, type:String
    	      optional :image, type:String
    	    end  
    	  end
    	  ## This takes care of creating user
    	  post do
    	    User.new(params[:user]).save!
    	  end 

    	  desc "delete an user"
    	  ## This takes care of parameter validation
    	  params do
    	    requires :id, type:String, desc: "ID of the user"
    	  end
    	  ## This takes care of deleting user
    	  delete ":id" do
    	    User.find(params[:id]).destroy!  
    	  end  

    	  desc "update an user"
    	  ## This takes care of parameter validation
    	  params do
    	    group :user, type: Hash do
    	      optional :name, type: String
    	      optional :uid, type: String
    	      optional :age, type:Integer
    	      optional :access_token, type:String
    	      optional :image, type:String
    	   
    	    end  
    	  end
    	  ## This takes care of editing user
    	  put ":id" do
    	    User.find(params[:id]).update_attributes(params[:user])
    	  end 

    	end	
    end
  end
end
