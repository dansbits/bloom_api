module BloomApi
  # An alternate unique identifier for a provider
  class Identifier

    # Creates a new Identifier
    # @param raw_identifier [Hash]
    def initialize raw_identifier
      @raw_identifier = raw_identifier
    end

    # @return [String] the unique identifier
    def identifier
      @raw_identifier['identifier']
    end

    # @return [String] The issuing party for the identifier
    def issuer
      @raw_identifier['issuer']
    end

    # @return [String] The U.S. state in which the identifier applies
    def state
      @raw_identifier['state']
    end

    # @return [String]
    #   The type of identifier.
    #   Possible values are:
    #   * other
    #   * medicare upin
    #   * medicare id-type unspecified
    #   * medicaid
    #   * medicare oscar/certification
    #   * medicare nsc
    #   * medicare pin
    def type
      @raw_identifier['type']
    end

  end
end
