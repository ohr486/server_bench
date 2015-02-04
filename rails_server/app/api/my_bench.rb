module MyBench
  class API < Grape::API
    format :json
    prefix :api

    resource :group do
      route_param :id do
        desc "Return group member list."
        get :members do
          Group.find(params[:id]).users
        end
      end
    end
  end
end
