module BloomApi
  class Address

    def initialize raw_address
      @raw_address = raw_address
    end

    def city
      @raw_address['city']
    end

    def country
      @raw_address['country_code']
    end

    def fax
      @raw_address['fax']
    end

    def line1
      @raw_address['address_line']
    end

    def line2
      @raw_address['address_details_line']
    end

    def phone
      @raw_address['phone']
    end

    def state
      @raw_address['state']
    end

    def zip
      @raw_address['zip']
    end

  end
end
