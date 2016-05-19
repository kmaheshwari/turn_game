module API
  module V1
    class PlaystoreUrls < Grape::API
    	include API::V1::Defaults
    	resource :playstoreUrls do
    	  desc "Return all playstoreUrls"
    	  get "", root: :playstoreUrls do
    	    PlaystoreUrl.all
    	  end

    	  desc "Return an playstoreUrl"
    	  params do
    	    requires :id, type: String, desc: "ID of the playstoreUrl"
    	  end
    	  get ":id", root: "playstoreUrl" do
    	    PlaystoreUrl.where(id: permitted_params[:id]).first!
    	  end
    	  
    	  desc "create a new playstoreUrl"
    	  ## This takes care of parameter validation
    	  params do
    	    group :playstoreUrl, type: Hash do
    	      optional :url, type: String
    	      
    	    end  
    	  end
    	  ## This takes care of creating playstoreUrl
    	  post do
    	    PlaystoreUrl.new(params[:playstoreUrl]).save!
    	  end 

    	  desc "delete an playstoreUrl"
    	  ## This takes care of parameter validation
    	  params do
    	    requires :id, type:String, desc: "ID of the playstoreUrl"
    	  end
    	  ## This takes care of deleting playstoreUrl
    	  delete ":id" do
    	    PlaystoreUrl.find(params[:id]).destroy!  
    	  end  

    	  desc "update an playstoreUrl"
    	  ## This takes care of parameter validation
    	  params do
    	    group :playstoreUrl, type: Hash do
    	      optional :url, type: String
    	    end  
    	  end
    	  ## This takes care of editing playstoreUrl
    	  put ":id" do
    	    PlaystoreUrl.find(params[:id]).update_attributes(params[:playstoreUrl])
    	  end 

    	end	
    end
  end
end
