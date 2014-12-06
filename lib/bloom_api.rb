require "bloom_api/version"

module BloomApi

  require "bloom_api/api"
  require "bloom_api/provider"
  require "bloom_api/address"
  require "bloom_api/identifier"
  require "bloom_api/individual"
  require "bloom_api/organization"
  require "bloom_api/organization_official"
  require "bloom_api/specialty"

  class ProviderNotFound < Exception; end

  BASE_URL = "www.bloomapi.com"

  def self.find_by_npi(npi)
    response = Net::HTTP.get_response(BASE_URL, "/api/npis/#{npi}")

    build_provider(JSON.parse(response.body)['result']) if response.code == "200"
  end

  def self.build_provider(response)
    return Individual.new(response) if response['type'] == 'individual'
    return Organization.new(response) if response['type'] == 'organization'
  end

end
