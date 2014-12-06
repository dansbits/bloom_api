require_relative '../spec_helper'

describe BloomApi::OrganizationOfficial do

  let(:official_params) {{
    "credential" => "MPH",
    "first_name" => "AUDREY",
    "middle_name" => "ROSE",
    "last_name" => "MEYERS",
    "name_prefix" => "MS.",
    "name_suffix" => "Ruler of the Planet Omicron Persei VIII",
    "phone" => "2014478021",
    "title" => "PRESIDENT & CEO"
  }}

  let(:official) { BloomApi::OrganizationOfficial.new(official_params) }

  describe '#credential' do
    subject { official.credential }

    it { expect(subject).to eq 'MPH' }
  end

  describe '#first_name' do
    subject { official.first_name }

    it { expect(subject).to eq 'AUDREY' }
  end

  describe '#last_name' do
    subject { official.last_name }

    it { expect(subject).to eq 'MEYERS' }
  end

  describe '#middle_name' do
    subject { official.middle_name }

    it { expect(subject).to eq 'ROSE' }
  end

  describe '#name_prefix' do
    subject { official.name_prefix }

    it { expect(subject).to eq 'MS.' }
  end

  describe '#name_suffix' do
    subject { official.name_suffix }

    it { expect(subject).to eq 'Ruler of the Planet Omicron Persei VIII' }
  end

  describe '#phone' do
    subject { official.phone }

    it { expect(subject).to eq '2014478021' }
  end

  describe '#title' do
    subject { official.title }
    it { expect(subject).to eq 'PRESIDENT & CEO' }
  end
end
