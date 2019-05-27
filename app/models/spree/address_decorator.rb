Spree::Address.class_eval do
    belongs_to :suburb, class_name: 'Spree::Suburb', optional: true
end