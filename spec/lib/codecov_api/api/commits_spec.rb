# frozen_string_literal: true
require 'spec_helper'
require_relative '../../../../lib/codecov_api/api/commits.rb'

RSpec.describe CodecovApi::Api::Commits do
  let(:owner) {'owner'}
  let(:repo) {'repo'}
  let(:base_url) {"https://codecov.io/api/gh/#{owner}/#{repo}"}
  let(:sha) {'da39a3ee5e6b4b0d3255bfef95601890afd80709'}
  subject do
    described_class.new(owner, repo)
  end

  before(:example) do
    allow(ENV).to receive(:[]).with('CODECOV_AUTH_TOKEN').and_return('some_valid_auth_token')
  end

  it 'should request a valid URL and return a JSON for one commit' do
    json = '{"param": "value"}'
    allow(subject).to receive(:get_response).with("#{base_url}/commit/#{sha}").and_return(json)
    expect(subject.get(sha)).to eq(json)
  end
end
