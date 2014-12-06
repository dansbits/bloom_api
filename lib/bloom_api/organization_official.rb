module BloomApi
  class OrganizationOfficial

    def initialize(raw_official)
      @raw_official = raw_official
    end

    def credential
      @raw_official['credential']
    end

    def first_name
      @raw_official['first_name']
    end

    def last_name
      @raw_official['last_name']
    end

    def middle_name
      @raw_official['middle_name']
    end

    def name_prefix
      @raw_official['name_prefix']
    end

    def name_suffix
      @raw_official['name_suffix']
    end

    def phone
      @raw_official['phone']
    end

    def title
      @raw_official['title']
    end

  end
end
