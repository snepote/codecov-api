# codecov_api
Unofficial toolset to consume CodeCov's API v4.3.0

[![Build Status](https://travis-ci.org/snepote/codecov_api.svg?branch=master)](https://travis-ci.org/snepote/codecov_api) [![Gem Version](https://badge.fury.io/rb/codecov_api.svg)](https://badge.fury.io/rb/codecov_api)

## Usage
```bash
export CODECOV_AUTH_TOKEN={CODECOV_AUTH_TOKEN}
gem install codecov_api
irb
```
```Ruby
2.2.6 :001 > require 'codecov_api'
 => true
 2.2.6 :002 > commits = CodecovApi::Api::Commits.new('snepote', 'codecov_api')
  => #<CodecovApi::Api::Commits:0x007fee2043c298 @owner="snepote", @repo="codecov_api">
 2.2.6 :003 > commits.list
```

## CodeCov API
* [Usage reference](https://docs.codecov.io/reference#usage)
* See [Authorization](https://docs.codecov.io/reference#authorization) for instructions of how to create a token

## Requirements
* Ruby version: 2.2.6
