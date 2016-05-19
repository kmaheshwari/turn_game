module API
  module V1
    class Categories < Grape::API
    	include API::V1::Defaults
    	resource :categories do
    	  desc "Return all categories"
    	  get "", root: :categories do
    	    Category.all
    	  end

    	  desc "Return an category"
    	  params do
    	    requires :id, type: String, desc: "ID of the category"
    	  end
    	  get ":id", root: "category" do
    	    Category.where(id: permitted_params[:id]).first!
    	  end

    	  desc "create a new category"
    	  ## This takes care of parameter validation
    	  params do
    	    group :category, type: Hash do
    	      optional :category_name, type: String
    	    end
    	  end
    	  ## This takes care of creating category
    	  post do
    	    Category.new(params[:category]).save!
    	  end

    	  desc "delete an category"
    	  ## This takes care of parameter validation
    	  params do
    	    requires :id, type:String, desc: "ID of the category"
    	  end
    	  ## This takes care of deleting category
    	  delete ":id" do
    	    Category.find(params[:id]).destroy!
    	  end

    	  desc "update an category"
    	  ## This takes care of parameter validation
    	  params do
    	    group :category, type: Hash do
    	      optional :category_name, type: String
    	    end
    	  end
    	  ## This takes care of editing category
    	  put ":id" do
    	    Category.find(params[:id]).update_attributes(params[:category])
    	  end

    	end
    end
  end
end
