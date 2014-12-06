require_relative '../spec_helper'

describe BloomApi::Address do
  let(:address_params) {{
    "address_details_line"  => "APT 1A",
    "address_line"          => "45 W 11TH ST",
    "city"                  => "NEW YORK",
    "country_code"          => "US",
    "fax"                   => "555-234-5678",
    "phone"                 => "555-123-4567",
    "state"                 => "NY",
    "zip"                   => "100118664"
  }}

  let(:address) { BloomApi::Address.new(address_params) }

  describe '#line1' do
    subject { address.line1 }

    it { expect(subject).to eq "45 W 11TH ST" }
  end

  describe '#line2' do
    subject { address.line2 }

    it { expect(subject).to eq "APT 1A" }
  end

  describe '#city' do
    subject { address.city }

    it { expect(subject).to eq "NEW YORK" }
  end

  describe '#country' do
    subject { address.country }

    it { expect(subject).to eq "US" }
  end

  describe '#fax' do
    subject { address.fax }

    it { expect(subject).to eq "555-234-5678" }
  end

  describe '#phone' do
    subject { address.phone }

    it { expect(subject).to eq "555-123-4567" }
  end

  describe '#state' do
    subject { address.state }

    it { expect(subject).to eq "NY" }
  end

  describe '#zip' do
    subject { address.zip }

    it { expect(subject).to eq "100118664" }
  end
end
