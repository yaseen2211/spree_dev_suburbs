module Spree
  class SuburbsController < Spree::StoreController
    respond_to :json

    def index
      state = params[:state_id].present? ? Spree::State.find(params[:state_id]) : Spree::State.first
      @suburbs = state.suburbs.order(name: :asc)
      render json: @suburbs
    end

  end
end
