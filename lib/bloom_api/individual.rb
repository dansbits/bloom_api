module BloomApi
  class Individual < Provider

    def credential
      @raw_provider['credential']
    end

    def first_name
      @raw_provider['first_name']
    end

    def gender
      @raw_provider['gender']
    end

    def last_name
      @raw_provider['last_name']
    end

    def middle_name
      @raw_provider['middle_name']
    end

    def name_prefix
      @raw_provider['name_prefix']
    end

    def name_suffix
      @raw_provider['name_suffix']
    end

    def other_credential
      @raw_provider['other_credential']
    end

    def other_first_name
      @raw_provider['other_first_name']
    end

    def other_last_name
      @raw_provider['other_last_name']
    end

    def other_last_name_type_code
      @raw_provider['provider_other_last_name_type_code']
    end

    def other_middle_name
      @raw_provider['other_middle_name']
    end

    def other_name_prefix
      @raw_provider['other_name_prefix']
    end

    def other_name_suffix
      @raw_provider['other_name_suffix']
    end
  end
end
