# frozen_string_literal: true
require 'spec_helper'
require_relative '../../../../lib/codecov_api/objects/folder_totals.rb'

RSpec.describe CodecovApi::Objects::FolderTotals do
  subject do
    CodecovApi::Objects::FolderTotals.new('{
      "commit": {
        "folder_totals": {
          "files": 324,
          "lines": 10274,
          "hits": 4988,
          "misses": 5286,
          "partials": 0,
          "coverage": "48.54974",
          "branches": 0,
          "methods": 0,
          "messages": 0,
          "sessions": 0,
          "complexity": 0,
          "complexity_total": 0,
          "diff": 0
        }
      }
    }')
  end

  it 'should have a files' do
    expect(subject.files).to eq(324)
  end

  it 'should have a lines' do
    expect(subject.lines).to eq(10_274)
  end

  it 'should have a hits' do
    expect(subject.hits).to eq(4_988)
  end

  it 'should have a misses' do
    expect(subject.misses).to eq(5_286)
  end

  it 'should have a coverage' do
    expect(subject.coverage).to eq('48.54974')
  end
end
