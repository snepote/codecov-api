# frozen_string_literal: true
require 'spec_helper'
require_relative '../../../../lib/codecov_api/api/commits.rb'

RSpec.describe CodecovApi::Api::Commits do
  let(:owner) {'owner'}
  let(:repo) {'repo'}
  let(:base_url) {"https://codecov.io/api/gh/#{owner}/#{repo}"}
  let(:json) {'{"param": "value"}'}
  subject do
    described_class.new(owner, repo)
  end

  let(:sha) {'da39a3ee5e6b4b0d3255bfef95601890afd80709'}
  let(:from) {Time.new(2016, 8, 18, 17, 32, 25)}
  let(:to) {Time.new(2017, 1, 14, 10, 00, 00)}

  before(:example) do
    allow(ENV).to receive(:[]).with('CODECOV_AUTH_TOKEN').and_return('some_valid_auth_token')
  end

  it 'should request a valid URL and return a JSON for one commit' do
    allow(subject).to receive(:response).with("#{base_url}/commit/#{sha}").and_return(json)
    expect(subject.get(sha)).to eq(json)
  end

  describe '#list' do
    it 'should requests a list of commits without parameters' do
      allow(subject)
        .to receive(:response)
        .with("#{base_url}/commits")
        .and_return(json)
      expect(subject.list).to eq(json)
    end

    it 'should include params in the URL when filtering commits by date range' do
      allow(subject)
        .to receive(:response)
        .with("#{base_url}/commits/?from=2016-08-18 15:32:25&to=2017-01-14 09:00:00")
        .and_return(json)
      expect(subject.list(from.utc, to.utc)).to eq(json)
    end

    it 'should raise an error for non valid Time params' do
      allow(subject)
        .to receive(:response)
        .with("#{base_url}/commits/?from=2016-08-18 15:32:25")
        .and_return(json)
      expect { subject.list(from.utc, 'non_valid_time') }.to raise_error 'not a valid time'
    end
  end

  describe '#folder_totals' do
    it 'should request a folder with master as default branch' do
      allow(subject)
        .to receive(:response)
        .with("#{base_url}/tree/master/some_folder_path")
        .and_return(json)
      expect(subject.folder_totals('some_folder_path')).to eq(json)
    end
  end

end
