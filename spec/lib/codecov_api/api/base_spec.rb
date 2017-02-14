# frozen_string_literal: true
require 'spec_helper'
require_relative '../../../../lib/codecov_api/api/base.rb'

RSpec.describe CodecovApi::Api::Base do
  subject do
    described_class.new
  end

  it 'should raise an exception when base_path is not implemented' do
    expect { subject.send(:get_request, 'some/path') }.to raise_error 'base_path method not defined'
  end

  it 'should raise an exception when ENV CODECOV_AUTH_TOKEN is not defined :unless',
  unless: ENV['CODECOV_AUTH_TOKEN'] do
    expect { subject.send(:auth_token) }.to raise_error 'CODECOV_AUTH_TOKEN ENV VAR not defined'
  end

  it 'should return auth_token when ENV CODECOV_AUTH_TOKEN is defined' do
    allow(ENV).to receive(:[]).with('CODECOV_AUTH_TOKEN').and_return('some_valid_auth_token')
    expect(subject.send(:auth_token)).to include 'some_valid_auth_token'
  end

  it 'should return codecov url' do
    expect(subject.send(:base_url)).to include 'https://codecov.io/api/gh'
  end
end
