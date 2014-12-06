require_relative '../spec_helper'
require 'JSON'

describe BloomApi::Provider do

  let(:provider_params) { JSON.parse(
    '{
      "business_address":{
        "address_details_line":"SUITE 200",
        "address_line":"421 34TH ST",
        "city":"PASADENA",
        "country_code":"US",
        "state":"CA",
        "zip":"54321"
      },
      "credential":"MD",
      "deactivation_date":"2006-05-23T00:00:00.000Z",
      "deactivation_reason":"death",
      "enumeration_date":"2007-09-15T00:00:00.000Z",
      "first_name":"VINCENT",
      "gender":"male",
      "last_name":"GRAZIANO",
      "last_update_date":"2007-09-15T00:00:00.000Z",
      "name_prefix":"DR.",
      "npi":"1003002809",
      "other_name_type": "individual",
      "other_identifiers":[
        {
          "identifier": "4394003",
          "state": "CT",
          "type": "medicaid",
          "issuer": "CMS"
        }
      ],
      "practice_address":{
        "address_details_line":"APT 1A",
        "address_line":"45 W 11TH ST",
        "city":"NEW YORK",
        "country_code":"US",
        "phone":"6464072044",
        "state":"NY",
        "zip":"100118664"
      },
      "provider_details":[
        {
          "healthcare_taxonomy_code":"2085R0202X",
          "license_number":"00243641",
          "taxonomy_switch":"yes"
        }
      ],
      "reactivation_date":"2006-09-23T00:00:00.000Z",
      "replacement_npi":"1234567890",
      "sole_proprietor":"yes",
      "taxonomy_groups":[
        {"taxonomy":"193200000X"},
        {"taxonomy":"193400000X"}
      ],
      "type":"individual"
    }'
  )}

  let(:provider) { BloomApi::Provider.new(provider_params) }

  describe '#business_address' do
    subject { provider.business_address }

    it 'returns an address object' do
      expect(subject).to be_a_kind_of BloomApi::Address
    end

    it 'uses the correct address' do
      expect(subject.line1).to eq '421 34TH ST'
    end
  end

  describe '#deactivation_date' do
    subject { provider.deactivation_date }

    it { expect(subject).to eq Date.new(2006,5,23) }
  end

  describe '#deactivation_reason' do
    subject { provider.deactivation_reason }

    it { expect(subject).to eq 'death' }
  end

  describe '#npi' do
    subject { provider.npi }

    it { expect(subject).to eq '1003002809' }
  end

  describe '#other_identifiers' do
    subject { provider.other_identifiers }

    it 'gets all the other identifiers' do
      expect(subject.count).to eq 1
    end

    it 'returns an array of identifier objects' do
      expect(subject.first).to be_a_kind_of BloomApi::Identifier
    end

    it 'fills in the right information' do
      expect(subject.first.identifier).to eq '4394003'
    end

    context 'when no other identifiers are present' do
      before { provider_params.delete('other_identifiers' )}
      it { expect(subject).to be_nil }
    end
  end

  describe '#other_name_type' do
    subject { provider.other_name_type }

    it { expect(subject).to eq 'individual'}
  end

  describe '#practice_address' do
    subject { provider.practice_address }

    it 'returns an address object' do
      expect(subject).to be_a_kind_of BloomApi::Address
    end

    it 'returns the correct address' do
      expect(subject.line1).to eq "45 W 11TH ST"
    end
  end

  describe '#specialties' do
    subject { provider.specialties }

    it 'returns an array of specialties' do
      expect(subject.first).to be_a BloomApi::Specialty
    end

    it 'uses the correct data' do
      expect(subject.first.specialty_code).to eq '2085R0202X'
    end

    context 'when no specialties are provided' do
      before { provider_params.delete('provider_details') }

      it { expect(subject).to be_nil }
    end
  end

  describe '#reactivation_date' do
    subject { provider.reactivation_date }

    it { expect(subject).to eq Date.new(2006,9,23) }
  end

  describe '#recorded_at' do
    subject { provider.recorded_at }

    it { expect(subject).to eq Time.parse(provider_params['enumeration_date']).to_date }
  end

  describe '#replacement_npi' do
    subject { provider.replacement_npi }

    it { expect(subject).to eq '1234567890' }
  end

  describe '#sole_proprietor?' do
    subject { provider.sole_proprietor? }

    context 'yes' do
      it { expect(subject).to eq true }
    end

    context 'no' do
      before { provider_params['sole_proprietor'] = 'no' }
      it { expect(subject).to eq false }
    end

    context 'not answered' do
      before { provider_params['sole_proprietor'] = 'not answered' }

      it { expect(subject).to be_nil }
    end
  end

  describe '#taxonomy_groups' do
    subject { provider.taxonomy_groups }

    it { expect(subject.count).to eq 2 }

    it 'returns the right values' do
      expect(subject[0]).to eq '193200000X'
      expect(subject[1]).to eq '193400000X'
    end
  end

  describe '#type' do
    subject { provider.type }

    it { expect(subject).to eq 'individual' }
  end

  describe '#updated_at' do
    subject { provider.updated_at }

    it { expect(subject).to eq Time.parse(provider_params['last_update_date']).to_date}
  end
end
