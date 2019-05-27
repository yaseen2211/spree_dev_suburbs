Spree::Zone.class_eval do
	
	with_options through: :zone_members, source: :zoneable do
      has_many :suburbs, source_type: 'Spree::Suburb'
    end

    def self.match(address)
      return unless address &&
        matches = includes(:zone_members).
                    order('spree_zones.zone_members_count', 'spree_zones.created_at').
                    where("(spree_zone_members.zoneable_type = 'Spree::Country' AND " \
                          'spree_zone_members.zoneable_id = ?) OR ' \
                          "(spree_zone_members.zoneable_type = 'Spree::State' AND " \
                          'spree_zone_members.zoneable_id = ?) OR ' \
                          "(spree_zone_members.zoneable_type = 'Spree::Suburb' AND " \
                          'spree_zone_members.zoneable_id=?)', address.country_id, address.state_id, address.suburb_id).
                    references(:zones)

      %w[state country suburb].each do |zone_kind|
        if match = matches.detect { |zone| zone_kind == zone.kind }
          return match
        end
      end
      matches.first
    end

    def include?(address)
      return false unless address

      members.any? do |zone_member|
        case zone_member.zoneable_type
        when 'Spree::Country'
          zone_member.zoneable_id == address.country_id
        when 'Spree::State'
          zone_member.zoneable_id == address.state_id
        when 'Spree::Suburb'
          zone_member.zoneable_id == address.suburb_id
        else
          false
        end
      end
    end

end