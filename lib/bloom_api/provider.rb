module BloomApi

  # A class representing a generic provider. This is a base
  # class for individuals and organizations.
  class Provider

    # Create a new provider
    # @param [Hash]
    #   a hash representation of a json provider
    #   object from the bloom API
    def initialize(raw_provider)
      @raw_provider = raw_provider
    end

    # @return [BloomApi::Address] the provider's business address
    def business_address
      Address.new(@raw_provider['business_address'])
    end

    # @return [Date]
    #   if the provider has been deactivated returns the date of deactivation
    # @return [nil] if the the provider has not been deactivated
    def deactivation_date
      unless @raw_provider['deactivation_date'].nil?
        Time.parse(@raw_provider['deactivation_date']).to_date
      end
    end

    # @return [String] the reason the provider was deactivated
    def deactivation_reason
      @raw_provider['deactivation_reason']
    end

    # @return [String] the provider's national provider identifier
    def npi
      @raw_provider['npi']
    end

    # @return [BloomApi::Address] the provider's practice address
    def practice_address
      Address.new(@raw_provider['practice_address'])
    end

    # @return [Array] A list of alternate identifiers for the provider
    def other_identifiers
      unless @raw_provider['other_identifiers'].nil?
        @raw_provider['other_identifiers'].collect { |i| BloomApi::Identifier.new(i) }
      end
    end

    # @return [String]
    #   a type describing the purpose of the provider's alternate name
    def other_name_type
      @raw_provider['other_name_type']
    end

    # @return [Date]
    #   the reactivation date for the provider if it's been reactivated
    # @return [nil] if the provider has not been reactivated
    def reactivation_date
      unless @raw_provider['reactivation_date'].nil?
        Time.parse(@raw_provider['reactivation_date']).to_date
      end
    end

    # @return [Date]
    #   the date that the provider information was recorded
    def recorded_at
      Time.parse(@raw_provider['enumeration_date']).to_date
    end

    # @return [String]
    #   the provider's replacement npi
    def replacement_npi
      @raw_provider['replacement_npi']
    end

    # @return [boolean] true if the provider is a sole proprietor
    # @return [boolean] false if the provider is not a sole proprietor
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

    # @return [Array] an array of specialties held by the provider
    def specialties
      unless @raw_provider['provider_details'].nil?
        @raw_provider['provider_details'].collect { |s| Specialty.new(s) }
      end
    end

    # @return [Array] an array of taxonomy groups for the provider
    def taxonomy_groups
      unless @raw_provider['taxonomy_groups'].nil?
        @raw_provider['taxonomy_groups'].collect { |g| g['taxonomy']}
      end
    end

    # @return [String]
    #   The provider type. Possible values are:
    #   * individual
    #   * organization
    def type
      @raw_provider['type']
    end

    # @return [Date] the date that the provider's data was last updated
    def updated_at
      Time.parse(@raw_provider['last_update_date']).to_date
    end
  end
end
