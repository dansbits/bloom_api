require_relative '../spec_helper'

describe BloomApi::Identifier do

  let(:identifier_params) {{
    "identifier"  => "4394003",
    "state"       => "CT",
    "type"        => "medicaid",
    "issuer"      => "CMS"
  }}

  let(:identifier) { BloomApi::Identifier.new(identifier_params) }

  describe '#identifier' do
    subject { identifier.identifier }

    it { expect(subject).to eq "4394003" }
  end

  describe '#issuer' do
    subject { identifier.issuer }

    it { expect(subject).to eq "CMS" }
  end

  describe '#state' do
    subject { identifier.state }

    it { expect(subject).to eq "CT" }
  end

  describe '#type' do
    subject { identifier.type }

    it { expect(subject).to eq "medicaid" }
  end
end
