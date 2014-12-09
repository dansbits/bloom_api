module BloomApi

  #A class representing an organizational provider
  class Organization < Provider

    # @return [String] the organization's employer identification number
    def employer_identification_number
      case @raw_provider['employer_identification_number']
      when '<UNAVAIL>'
        nil
      else
        @raw_provider['employer_identification_number']
      end
    end

    # designates whether the organization is a part of another
    # @return [boolean] true if part of another organization
    # @return [boolean] false if not part of another organization
    def is_subpart?
      case @raw_provider['organization_subpart']
      when 'yes'
        true
      when 'no'
        false
      else
        nil
      end
    end

    # @return [String] the business name of the organization
    def name
      @raw_provider['business_name']
    end

    # @return [OrganizationOfficial] the organization's administrative official
    def official
      unless @raw_provider['organization_official'].nil?
        OrganizationOfficial.new(@raw_provider['organization_official'])
      end
    end

    # @return [String] an alternate name for the organization
    def other_name
      @raw_provider['other_name']
    end

    # @return [Organization] if the provider has a parent organization
    # @return nil if there is no parent organization
    def parent_organization
      unless @raw_provider['parent_org'].nil?
        Organization.new(@raw_provider['parent_org'])
      end
    end

    # @return [String] the organization's tax identification number
    def tax_identification_number
      @raw_provider['tax_identification_number']
    end

  end
end
