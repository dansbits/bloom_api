require_relative '../spec_helper'
require 'JSON'

describe BloomApi::Individual do

  let(:provider_params) { JSON.parse(
    '{
      "business_address":{
        "address_details_line":"APT 1A",
        "address_line":"45 W 11TH ST",
        "city":"NEW YORK",
        "country_code":"US",
        "state":"NY",
        "zip":"100118664"
      },
      "credential":"MD",
      "deactivation_date":"2006-05-23T00:00:00.000Z",
      "deactivation_reason":"death",
      "enumeration_date":"2007-09-15T00:00:00.000Z",
      "first_name":"VINCENT",
      "gender":"male",
      "last_name":"GRAZIANO",
      "last_update_date":"2007-09-15T00:00:00.000Z",
      "middle_name":"J",
      "name_prefix":"DR.",
      "name_suffix":"III",
      "npi":"1003002809",
      "other_first_name":"Donald",
      "other_last_name":"Duck",
      "other_middle_name":"D",
      "other_name_prefix":"Mr.",
      "other_name_suffix":"Jr.",
      "other_name_type": "individual",
      "other_credential": "CSW",
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
      "provider_other_last_name_type_code":"former name",
      "reactivation_date":"2006-09-23T00:00:00.000Z",
      "replacement_npi":"1234567890",
      "sole_proprietor":"yes",
      "type":"individual",
      "title":"Chief Medical Officer"
  }'
  )}

  let(:provider) { BloomApi::Individual.new(provider_params) }

  describe '#credential' do
    subject { provider.credential }

    it { expect(subject).to eq 'MD' }
  end

  describe '#first_name' do
    subject { provider.first_name }

    it { expect(subject).to eq 'VINCENT' }
  end

  describe '#gender' do
    subject { provider.gender }

    it { expect(subject).to eq 'male' }
  end

  describe '#last_name' do
    subject { provider.last_name }

    it { expect(subject).to eq 'GRAZIANO' }
  end

  describe '#middle_name' do
    subject { provider.middle_name }

    it { expect(subject).to eq 'J' }
  end

  describe '#name_prefix' do
    subject { provider.name_prefix }
    it { expect(subject).to eq 'DR.' }
  end

  describe '#name_suffix' do
    subject { provider.name_suffix }
    it { expect(subject).to eq 'III' }
  end

  describe '#other_credential' do
    subject { provider.other_credential }

    it { expect(subject).to eq 'CSW' }
  end

  describe '#other_first_name' do
    subject { provider.other_first_name }

    it { expect(subject).to eq 'Donald' }
  end

  describe '#other_last_name' do
    subject { provider.other_last_name }

    it { expect(subject).to eq 'Duck' }
  end

  describe '#other_middle_name' do
    subject { provider.other_middle_name }

    it { expect(subject).to eq 'D' }
  end

  describe '#other_name_prefix' do
    subject { provider.other_name_prefix }

    it { expect(subject).to eq 'Mr.' }
  end

  describe '#other_name_suffix' do
    subject { provider.other_name_suffix }

    it { expect(subject).to eq 'Jr.' }
  end

  describe '#other_last_name_type_code' do
    subject { provider.other_last_name_type_code }

    it { expect(subject).to eq 'former name'}
  end

end
