module BloomApi
  class Provider

    def initialize(raw_provider)
      @raw_provider = raw_provider
    end

    def business_address
      Address.new(@raw_provider['business_address'])
    end

    def deactivation_date
      Time.parse(@raw_provider['deactivation_date']).to_date
    end

    def deactivation_reason
      @raw_provider['deactivation_reason']
    end

    def npi
      @raw_provider['npi']
    end

    def practice_address
      Address.new(@raw_provider['practice_address'])
    end

    def other_identifiers
      unless @raw_provider['other_identifiers'].nil?
        @raw_provider['other_identifiers'].collect { |i| BloomApi::Identifier.new(i) }
      end
    end

    def other_name_type
      @raw_provider['other_name_type']
    end

    def reactivation_date
      Time.parse(@raw_provider['reactivation_date']).to_date
    end

    def recorded_at
      Time.parse(@raw_provider['enumeration_date']).to_date
    end

    def replacement_npi
      @raw_provider['replacement_npi']
    end

    def sole_proprietor?
      case @raw_provider['sole_proprietor']
      when 'yes'
        true
      when 'no'
        false
      else
        nil
      end
    end

    def specialties
      unless @raw_provider['provider_details'].nil?
        @raw_provider['provider_details'].collect { |s| Specialty.new(s) }
      end
    end

    def taxonomy_groups
      unless @raw_provider['taxonomy_groups'].nil?
        @raw_provider['taxonomy_groups'].collect { |g| g['taxonomy']}
      end
    end

    def type
      @raw_provider['type']
    end

    def updated_at
      Time.parse(@raw_provider['last_update_date']).to_date
    end
  end
end
