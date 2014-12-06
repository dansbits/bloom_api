require_relative '../spec_helper'

describe BloomApi::Specialty do

  let (:specialty_params) {{
    "healthcare_taxonomy_code"  => "2085R0202X",
    "license_number"            => "00243641",
    "license_number_state"      => "state",
    "taxonomy_switch"           => "yes"
  }}

  let(:specialty) { BloomApi::Specialty.new(specialty_params) }


  describe '#license_number' do
    subject { specialty.license_number }

    it { expect(subject).to eq '00243641' }
  end

  describe '#license_number_state' do
    subject { specialty.license_number_state }

    it { expect(subject).to eq 'state' }
  end

  describe '#specialty_code' do
    subject { specialty.specialty_code }

    it { expect(subject).to eq '2085R0202X' }
  end

  describe '#primary_specialty?' do
    subject { specialty.primary_specialty? }

    context 'yes' do
      it { expect(subject).to eq true }
    end

    context 'no' do
      before { specialty_params['taxonomy_switch'] = 'no' }
      it { expect(subject).to eq false }
    end

    context 'not answered' do
      before { specialty_params['taxonomy_switch'] = 'not answered' }

      it { expect(subject).to be_nil }
    end
  end
end
