module BloomApi
  # A class representing an organization official
  class OrganizationOfficial

    # Creates a new OrganizationOfficial
    # @param raw_official [Hash]
    #   A hash representation of the organization_official object
    #   available in the BloomApi
    def initialize(raw_official)
      @raw_official = raw_official
    end

    # @return [String] the official's professional credential
    def credential
      @raw_official['credential']
    end

    # @return [String] the official's first name
    def first_name
      @raw_official['first_name']
    end

    # @return [String] the official's last name
    def last_name
      @raw_official['last_name']
    end

    # @return [String] the official's middle name
    def middle_name
      @raw_official['middle_name']
    end

    # @return [String] the official's name prefix
    def name_prefix
      @raw_official['name_prefix']
    end

    # @return [String] the official's name suffix
    def name_suffix
      @raw_official['name_suffix']
    end

    # @return [String] the official's phone number
    def phone
      @raw_official['phone']
    end

    # @return [String] the official's professional title
    def title
      @raw_official['title']
    end

  end
end
