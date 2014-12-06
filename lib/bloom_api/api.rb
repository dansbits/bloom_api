require 'net/http'

module BloomApi
  class Api

    def self.find_by_npi(npi)
      url = "#{BASE_URL}/npis/#{npi}"

      response = Net::HTTP.get_response(url)
    end

  end
end
