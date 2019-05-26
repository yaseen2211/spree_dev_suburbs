module Spree
  class Suburb < Spree::Base
  	belongs_to :state, class_name: 'Spree::State'
  end
end
