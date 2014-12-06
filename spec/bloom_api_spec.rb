require_relative './spec_helper'
require 'JSON'

describe BloomApi do

  describe '#find_by_npi' do

    subject { BloomApi.find_by_npi(npi) }


    context 'when given a valid npi' do
      context 'for an individual' do
        let(:npi) { '1003002809' }

        it { expect(subject).to be_a BloomApi::Individual }

        it 'returns the right provider' do
          provider = subject
          expect(provider.npi).to eq '1003002809'
        end
      end

      context 'for an organization' do
        let(:npi) { '1013191311' }

        it { expect(subject).to be_a BloomApi::Organization }

        it 'returns the right provider' do
          expect(subject.npi).to eq '1013191311'
        end
      end
    end

    context 'when given an invalid npi' do
      let(:npi) { 'bogus_npi' }

      it 'returns nil' do
        expect(subject).to be_nil
      end
    end

  end
end
