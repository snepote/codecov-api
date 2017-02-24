# frozen_string_literal: true
require 'spec_helper'
require_relative '../../../../lib/codecov_api/api/commits.rb'

RSpec.describe CodecovApi::Api::Commits do
  let(:owner) { 'owner' }
  let(:repo) { 'repo' }
  let(:base_url) { "https://codecov.io/api/gh/#{owner}/#{repo}" }
  let(:json) { '{"param": "value"}' }
  subject do
    described_class.new(owner, repo)
  end
  let(:sha) { 'da39a3ee5e6b4b0d3255bfef95601890afd80709' }
  let(:from) { Time.new(2016, 8, 18, 17, 32, 25).utc }
  let(:to) { Time.new(2017, 0o1, 14, 10, 0o0, 0o0).utc }

  before(:example) do
    allow(subject).to receive(:auth_token).and_return('some_valid_auth_token')
  end

  it 'should request a valid URL and return a JSON for one commit' do
    stub_request(:get, "#{base_url}/commit/#{sha}").to_return(body: json)
    expect(subject.get(sha)).to eq(json)
  end

  describe '#list' do
    it 'should requests a list of commits without parameters' do
      stub_request(:get, "#{base_url}/commits").to_return(body: json)
      expect(subject.list).to eq(json)
    end

    it 'should include params in the URL when filtering commits by date range' do
      u = "#{base_url}/commits/?from=#{from.utc.strftime('%F %T')}""&to=#{to.utc.strftime('%F %T')}"
      stub_request(:get, u).to_return(body: json)
      expect(subject.list(from, to)).to eq(json)
    end

    it 'should raise an error for non valid Time params' do
      stub_request(:get, "#{base_url}/commits/?from=#{from.utc.strftime('%F %T')}")
        .to_return(body: json)
      expect { subject.list(from, 'non_valid_time') }.to raise_error 'not a valid time'
    end
  end

  describe '#folder_totals' do
    it 'should request a folder with master as default branch' do
      stub_request(:get, "#{base_url}/tree/master/some_folder_path").to_return(body: json)
      expect(subject.folder_totals('some_folder_path')).to eq(json)
    end
  end
end
