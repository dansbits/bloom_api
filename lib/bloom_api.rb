require "bloom_api/version"

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
    return Individual.new(response) if response['type'] == 'individual'
    return Organization.new(response) if response['type'] == 'organization'
    Provider.new(response)
  end

end
