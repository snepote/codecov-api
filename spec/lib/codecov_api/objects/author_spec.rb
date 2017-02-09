require 'spec_helper'
require_relative '../../../../lib/codecov_api/objects/author.rb'

RSpec.describe CodecovApi::Objects::Author do
  subject do CodecovApi::Objects::Author.new('{
      "author": {
        "service": "github",
        "name": "Gafsi",
        "email": "hello@codecov.io",
        "username": "codecov",
        "service_id": "12345"
      }
    }')
  end

  it 'should have a service' do
    expect(subject.service).to eq('github')
  end

  it 'should have a name' do
    expect(subject.name).to eq('Gafsi')
  end

  it 'should have a email' do
    expect(subject.email).to eq('hello@codecov.io')
  end

  it 'should have a username' do
    expect(subject.username).to eq('codecov')
  end

  it 'should have a service_id' do
    expect(subject.service_id).to eq('12345')
  end
end
