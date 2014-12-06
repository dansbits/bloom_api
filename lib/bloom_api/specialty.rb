module BloomApi
  class Specialty

    def initialize raw_detail
      @raw_detail = raw_detail
    end

    def license_number
      @raw_detail['license_number']
    end

    def license_number_state
      @raw_detail['license_number_state']
    end

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

    def specialty_code
      @raw_detail['healthcare_taxonomy_code']
    end

  end
end
