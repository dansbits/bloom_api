require_relative '../spec_helper'

describe BloomApi::Api do

  describe '#find_by_npi' do

    before do
      allow(Net::HTTP).to receive(:get_response).with("www.bloomapi.com/api/npis/#{npi}").and_return(json_response)
    end

    subject { BloomApi::Api.find_by_npi(npi) }

    context 'when given a valid npi' do
      let(:npi) { '1003002809' }
      let(:json_response) { '{"result":{"business_address":{"address_details_line":"APT 1A","address_line":"45 W 11TH ST","city":"NEW YORK","country_code":"US","state":"NY","zip":"100118664"},"credential":"MD","enumeration_date":"2007-09-15T00:00:00.000Z","first_name":"VINCENT","gender":"male","last_name":"GRAZIANO","last_update_date":"2007-09-15T00:00:00.000Z","name_prefix":"DR.","npi":"1003002809","practice_address":{"address_details_line":"APT 1A","address_line":"45 W 11TH ST","city":"NEW YORK","country_code":"US","phone":"6464072044","state":"NY","zip":"100118664"},"provider_details":[{"healthcare_taxonomy_code":"2085R0202X","license_number":"00243641","taxonomy_switch":"yes"}],"sole_proprietor":"yes","type":"individual"}}' }

      it 'fetches the data from the api' do
        expect(Net::HTTP).to receive(:get_response)
        subject
      end
    end
  end

end
