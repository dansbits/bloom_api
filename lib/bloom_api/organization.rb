module BloomApi
  class Organization < Provider

    def employer_identification_number
      case @raw_provider['employer_identification_number']
      when '<UNAVAIL>'
        nil
      else
        @raw_provider['employer_identification_number']
      end
    end

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

    def name
      @raw_provider['business_name']
    end

    def official
      unless @raw_provider['organization_official'].nil?
        OrganizationOfficial.new(@raw_provider['organization_official'])
      end
    end

    def other_name
      @raw_provider['other_name']
    end

    def parent_organization
      unless @raw_provider['parent_org'].nil?
        Organization.new(@raw_provider['parent_org'])
      end
    end

    def tax_identification_number
      @raw_provider['tax_identification_number']
    end

  end
end
