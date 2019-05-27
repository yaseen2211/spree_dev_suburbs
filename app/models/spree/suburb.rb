module Spree
  class Suburb < Spree::Base
  	belongs_to :state, class_name: 'Spree::State'
    has_many :addresses, dependent: :restrict_with_error

  	has_many :zone_members,
             -> { where(zoneable_type: 'Spree::Suburb') },
             class_name: 'Spree::ZoneMember',
             dependent: :destroy,
             foreign_key: :zoneable_id

    has_many :zones, through: :zone_members, class_name: 'Spree::Zone'

    validates :state, :name, presence: true
    validates :name, :abbr, uniqueness: { case_sensitive: false, scope: :state_id }, allow_blank: true
  end
end
