# frozen_string_literal: true
require 'spec_helper'
require_relative '../../../../lib/codecov_api/api/branches.rb'

RSpec.describe CodecovApi::Api::Branches do
  let(:owner) {'owner'}
  let(:repo) {'repo'}
  let(:base_url) {"https://codecov.io/api/gh/#{owner}/#{repo}"}
  let(:json) {'{"param": "value"}'}
  subject do
    described_class.new(owner, repo)
  end

  before(:example) do
    allow(ENV).to receive(:[]).with('CODECOV_AUTH_TOKEN').and_return('some_valid_auth_token')
  end

  describe '#list' do
    it 'should request a valid url' do
      allow(subject).to receive(:response).with("#{base_url}/branches").and_return(json)
      expect(subject.list).to eq(json)
    end
  end

  describe '#branch' do
    it 'should request a valid url' do
      allow(subject).to receive(:response).with("#{base_url}/branch/some_branch").and_return(json)
      expect(subject.get('some_branch')).to eq(json)
    end
  end
end
