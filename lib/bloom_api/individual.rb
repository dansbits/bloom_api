module BloomApi
  # A class representing an individual provider
  class Individual < Provider

    # @return [String] the provider's professional credential
    def credential
      @raw_provider['credential']
    end

    # @return [String] the provider's first name
    def first_name
      @raw_provider['first_name']
    end

    # @return [String] the provider's gender
    def gender
      @raw_provider['gender']
    end

    # @return [String] the provider's last name
    def last_name
      @raw_provider['last_name']
    end

    # @return [String] the provider's middle name
    def middle_name
      @raw_provider['middle_name']
    end

    # @return [String] the providers name prefix (Mr., Ms., etc.)
    def name_prefix
      @raw_provider['name_prefix']
    end

    # @return [String] the provider's name suffix (Jr., Sr., Etc.)
    def name_suffix
      @raw_provider['name_suffix']
    end

    # @return [String] an additional professional credential
    def other_credential
      @raw_provider['other_credential']
    end

    # @return [String] an alternate first name for the provider
    def other_first_name
      @raw_provider['other_first_name']
    end

    # @return [String] an alternate last name for the provider
    def other_last_name
      @raw_provider['other_last_name']
    end

    # @return [String]
    #   a code describing the purpose of the provider's alternate
    #   last name. Possible values are:
    #   * former name
    #   * professional name
    #   * doing business as
    #   * former legal business name
    #   * other name
    def other_last_name_type_code
      @raw_provider['provider_other_last_name_type_code']
    end

    # @return [String] the provider's alternate last name
    def other_middle_name
      @raw_provider['other_middle_name']
    end

    # @return [String] the provider's alternate name prefix
    def other_name_prefix
      @raw_provider['other_name_prefix']
    end

    # @return [String] the provider's altername name suffix
    def other_name_suffix
      @raw_provider['other_name_suffix']
    end
  end
end
