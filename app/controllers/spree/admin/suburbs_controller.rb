module Spree
  module Admin
    class SuburbsController < ResourceController
      belongs_to 'spree/state'
      before_action :load_data

      def index
        respond_with(@collection) do |format|
          format.html
          format.js { render partial: 'suburb_list' }
        end
      end

      protected

      def location_after_save
        admin_state_suburbs_url(@state)
      end

      def collection
        super.order(:name)
      end

      def load_data
      	country = Spree::Country.where(iso:'ae').last
      	if country.present?
        	@states = country.states.order(:name)
	    else
        	@states = State.order(:name)
	    end
      end
    end
  end
end
