module BloomApi
  class Identifier

    def initialize raw_identifier
      @raw_identifier = raw_identifier
    end

    def identifier
      @raw_identifier['identifier']
    end

    def issuer
      @raw_identifier['issuer']
    end

    def state
      @raw_identifier['state']
    end

    def type
      @raw_identifier['type']
    end

  end
end
