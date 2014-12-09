module BloomApi
  # An address object containing the availabile
  # data of business or practice addresses in Bloom API
  class Address

    # Creats a new BloomApi::Address
    #
    # @param [Hash]
    #   A hash representation of a JSON address as it would be
    #   returned from the Bloom API
    def initialize raw_address
      @raw_address = raw_address
    end

    # @return [String] The address's city
    def city
      @raw_address['city']
    end

    # @return [String] The address's country code
    def country
      @raw_address['country_code']
    end

    # @return [String] The fax number for the address
    def fax
      @raw_address['fax']
    end

    # @return [String] Line 1 of the address
    def line1
      @raw_address['address_line']
    end

    # @return [String] Line 2 of the address
    def line2
      @raw_address['address_details_line']
    end

    # @return [String] The contact phone number for the address
    def phone
      @raw_address['phone']
    end

    # @return [String] The 2-digit state code for the address
    def state
      @raw_address['state']
    end

    # @return [String] The zip code for the address
    def zip
      @raw_address['zip']
    end

  end
end
