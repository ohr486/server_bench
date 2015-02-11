module MyBench
  class API < Grape::API
    format :json
    prefix :api

    resource :users do
      desc "Return user info list."
      get do
        User.all
      end
      
      desc "Return user info."
      get "/:id" do
        User.find_by_id(params[:id]) || []
      end
    end

    resource :groups do
      desc "Return group info list."
      get do
        Group.all
      end
      
      desc "Return group info."
      get "/:id" do
        Group.find_by_id(params[:id]) || []
      end
    end

  end
end
