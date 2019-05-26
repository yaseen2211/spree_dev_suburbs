Spree::State.class_eval do
	has_many :suburbs, dependent: :destroy
end