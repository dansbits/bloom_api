module BloomApi
  # An class representing a provider specialty
  class Specialty

    # Creates a new specialty
    # @param raw_detail [Hash]
    #   A hash representation of a json specialty object
    #   from the Bloom Api
    def initialize raw_detail
      @raw_detail = raw_detail
    end

    # @return [String]
    #   the license number associated with the specialty
    def license_number
      @raw_detail['license_number']
    end

    # @return [String]
    #   the U.S. state in which the specialty applies
    def license_number_state
      @raw_detail['license_number_state']
    end

    # @return [boolean] true if this is the provider's primary specialty
    # @return [boolean] false if this is not the provider's primary specialty
    def primary_specialty?
      case @raw_detail['taxonomy_switch']
      when 'yes'
        true
      when 'no'
        false
      else
        nil
      end
    end

    # @return [String] the specialty's code
    def specialty_code
      @raw_detail['healthcare_taxonomy_code']
    end
  end
end
