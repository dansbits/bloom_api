require "bloom_api/version"
require "uri/http"

# A module which contains all code necessary for
# looking up health care providers via the Bloom API.
#
# For more details visit http://www.bloomapi.com/
#
# @author Dan Carpenter
module BloomApi

  require "bloom_api/provider"
  require "bloom_api/address"
  require "bloom_api/identifier"
  require "bloom_api/individual"
  require "bloom_api/organization"
  require "bloom_api/organization_official"
  require "bloom_api/specialty"

  # A custom exception for when no provider is found when performing a lookup.
  class ProviderNotFound < Exception; end

  # The base url for the bloom api.
  BASE_URL = "www.bloomapi.com"
  NPI_SEARCH_PATH = "/api/search/npi"

  # Look up a health care provider or organization by the provided criteria
  #
  # @params criteria [Hash] criteria to query against
  # @params limit [Integer] optional, sets the maximum number of records to return. Default is 20 and maximum is 100
  # @params offset [Integer] optional, sets a number of records to skip before returning. Default is 0
  # @return results [Array] Array of providers and/or organizations that match the criteria
  def self.find_by(options, limit=20, offset=0)
		criteria = options.each_with_index.map {|x,i| "key#{i+1}=#{URI::escape(x[0].to_s)}&op#{i+1}=eq&value#{i+1}=#{URI::escape(x[1])}"} || []
		criteria << "limit=#{limit}&offset=#{offset}"
		uri = URI::HTTP.build(host: BASE_URL, path: NPI_SEARCH_PATH, query: criteria.join('&'))
		response = Net::HTTP.get_response(uri)

		build_provider(JSON.parse(response.body)['result']) if response && response.code == "200"
  end

  # Look up a health care provider by their national provider identifier
  #
  # @params npi [String] The national provider identifier to be used for lookup
  # @return [BloomApi::Individual] if the npi references an individual provider
  # @return [BloomApi::Organization] if the npi references an organization
  #
  # @raise [ProviderNotFound] if the provided npi does not reference a provider
  def self.find_by_npi(npi)
    response = Net::HTTP.get_response(BASE_URL, "/api/npis/#{npi}")

    build_provider(JSON.parse(response.body)['result']) if response && response.code == "200"
  end

  private

  def self.build_provider(response)
    if response.is_a?(Array)
			response.map { |r| build_provider(r) }
    else
	    return Individual.new(response) if response['type'] == 'individual'
	    return Organization.new(response) if response['type'] == 'organization'
	    Provider.new(response)
    end
  end

end
