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

			context 'when type is not present' do
				let(:npi) { '1003998626' }

				it { expect(subject).to be_a BloomApi::Provider }

			end
		end

		context 'when given an invalid npi' do
			let(:npi) { 'bogus_npi' }

			it 'returns nil' do
				expect(subject).to be_nil
			end
		end

	end

	describe '#find_by' do

		subject { BloomApi.find_by(criteria) }

		context 'when given valid criteria' do
			context 'for an individual' do
				let(:criteria) { {'npi' => '1003002809'} }

				it { expect(subject).to be_a Array }
				it { expect(subject.size).to eq 1 }
				it { expect(subject.first).to be_a BloomApi::Individual }

				it 'returns the right provider' do
					expect(subject.first.npi).to eq '1003002809'
				end
			end

			context 'for an organization' do
				let(:criteria) { {'business_name' => 'WILBUR AVENUE', 'practice_address.zip' => '088653453'} }

				it { expect(subject).to be_a Array }
				it { expect(subject.size).to eq 1 }
				it { expect(subject.first).to be_a BloomApi::Organization }

				it 'returns the right organization' do
					expect(subject.first.npi).to eq '1013191311'
				end
			end

			context 'for mixed results' do
				let(:criteria) { {'practice_address.zip' => '088653453'} }

				it { expect(subject).to be_a Array }
				it { expect(subject.size).to eq 4 }
				it { expect(subject.map(&:class).uniq).to contain_exactly BloomApi::Organization, BloomApi::Individual }
			end

			context 'no matches' do
				let(:criteria) { {'business_name' => 'bogus_value'} }

				it { expect(subject).to be_a Array }
				it { expect(subject.empty?).to be_truthy }
			end
		end

		context 'when given invalid criteria' do
			let(:criteria) { {'bogus_field' => 'bogus_value'} }

			it { expect(subject).to be_a Array }
			it { expect(subject.empty?).to be_truthy }
		end

		context 'when passing symbols' do
			let(:criteria) { {npi: '1003002809'} }

			it { expect(subject).to be_a Array }
			it { expect(subject.size).to eq 1 }
			it { expect(subject.first).to be_a BloomApi::Individual }

			it 'returns the right provider' do
				expect(subject.first.npi).to eq '1003002809'
			end
		end

	end
end
