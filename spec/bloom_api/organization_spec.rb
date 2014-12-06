require_relative '../spec_helper'
require 'JSON'

describe BloomApi::Organization do

  let(:organization_prams) {JSON.parse('{
    "business_address":{
      "address_line":"223 N VAN DIEN AVE",
      "city":"RIDGEWOOD",
      "country_code":"US",
      "phone":"2014478000",
      "state":"NJ",
      "zip":"074502726"
    },
    "business_name":"THE VALLEY HOSPITAL INC.",
    "employer_identification_number":"123456",
    "enumeration_date":"2005-06-20T00:00:00.000Z",
    "last_update_date":"2008-11-25T00:00:00.000Z",
    "npi":"1013912633",
    "organization_official":{
      "first_name":"AUDREY",
      "last_name":"MEYERS",
      "name_prefix":"MS.",
      "phone":"2014478021",
      "title":"PRESIDENT \u0026 CEO"
    },
    "organization_subpart":"no",
    "other_identifiers":[
      {
        "identifier":"4135806",
        "state":"NJ",
        "type":"medicaid"
      },
      {
        "identifier":"310012",
        "state":"NJ",
        "type":"medicare oscar/certification"
      }
    ],
    "other_name":"THE VALLEY HOSPITAL INCORPORATED",
    "parent_org":{
      "business_name": "Acme Hosptial Inc.",
      "tax_identification_number": "T123IN324"
    },
    "practice_address":{
      "address_line":"223 N VAN DIEN AVE",
      "city":"RIDGEWOOD",
      "country_code":"US",
      "phone":"2014478000",
      "state":"NJ",
      "zip":"074502726"
    },
    "provider_details":[
      {
        "healthcare_taxonomy_code":"282N00000X",
        "license_number":"10211",
        "taxonomy_switch":"yes"
      }
    ],
    "tax_identification_number":"T123IN323",
    "type":"organization"
  }')}

  let(:organization) { BloomApi::Organization.new(organization_prams) }

  describe '#name' do
    subject { organization.name }

    it { expect(subject).to eq 'THE VALLEY HOSPITAL INC.' }
  end

  describe '#employer_identification_number' do
    subject { organization.employer_identification_number }

    it { expect(subject).to eq '123456' }

    context 'when unavailable' do
      before { organization_prams['employer_identification_number'] = '<UNAVAIL>' }

      it { expect(subject).to be_nil }
    end
  end

  describe '#official' do
    subject { organization.official }

    it 'returns an organization official object' do
      expect(subject).to be_a BloomApi::OrganizationOfficial
    end

    it 'returns an object with the right values' do
      expect(subject.first_name).to eq "AUDREY"
      expect(subject.last_name).to eq "MEYERS"
      expect(subject.name_prefix).to eq "MS."
      expect(subject.phone).to eq "2014478021"
      expect(subject.title).to eq "PRESIDENT & CEO"
    end

    context 'when official is not present' do
      before { organization_prams.delete('organization_official') }

      it { expect(subject).to be_nil }
    end
  end

  describe '#is_subpart?' do
    subject { organization.is_subpart? }

    context 'yes' do
      before { organization_prams['organization_subpart'] = 'yes' }

      it { expect(subject).to eq true }
    end

    context 'no' do
      it { expect(subject).to eq false }
    end

    context 'no answer' do
      before { organization_prams['organization_subpart'] = 'no answer' }

      it { expect(subject).to be_nil }
    end
  end

  describe '#other_name' do
    subject { organization.other_name }

    it { expect(subject).to eq 'THE VALLEY HOSPITAL INCORPORATED' }
  end

  describe '#parent_organization' do
    subject { organization.parent_organization }

    it 'returns an organization' do
      expect(subject).to be_a BloomApi::Organization
    end

    it 'has the right values' do
      expect(subject.name).to eq 'Acme Hosptial Inc.'
    end

    context 'when parent organization is not present' do
      before { organization_prams.delete('parent_org') }

      it { expect(subject).to be_nil }
    end
  end

  describe '#tax_identification_number' do
    subject { organization.tax_identification_number }

    it { expect(subject).to eq 'T123IN323' }
  end

end
