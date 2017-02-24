# frozen_string_literal: true
require 'spec_helper'
require_relative '../../../../lib/codecov_api/api/branches.rb'

RSpec.describe CodecovApi::Api::Branches do
  let(:owner) { 'owner' }
  let(:repo) { 'repo' }
  let(:base_url) { "https://codecov.io/api/gh/#{owner}/#{repo}" }
  let(:json) { '{"param": "value"}' }
  subject do
    described_class.new(owner, repo)
  end

  before(:example) do
    allow(subject).to receive(:auth_token).and_return('some_valid_auth_token')
  end

  describe '#list' do
    it 'should request a valid url' do
      stub_request(:get, "#{base_url}/branches").to_return(body: json)
      expect(subject.list).to eq json
    end
  end

  describe '#branch' do
    it 'should request a valid url' do
      stub_request(:get, "#{base_url}/branch/some_branch").to_return(body: json)
      expect(subject.get('some_branch')).to eq(json)
    end
  end
end
