module Spree
  class SuburbsController < Spree::StoreController
    respond_to :html

    def index
      state = params[:state_id].present? ? Spree::State.find(params[:state_id]) : Spree::State.first
      @suburbs = state.suburbs.order(name: :asc)
      respond_with(@suburbs) do |format|
        format.html
        format.js { render partial: 'suburb_dropdown' }
      end
    end

  end
end
