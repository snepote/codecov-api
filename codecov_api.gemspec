Gem::Specification.new do |s|
  s.name        = 'codecov_api'
  s.version     = '0.0.0'
  s.date        = '2017-02-08'
  s.summary     = "Codecov API"
  s.description = "Unofficial toolset to consume CodeCov's API"
  s.authors     = ["Sebastian Nepote"]
  s.email       = 'snepote@gmail.com'
  s.files       = ["lib/codecov_api.rb", "lib/codecov_api/api/commits.rb",
                   "lib/codecov_api/api/base.rb", "lib/codecov_api/api/branches.rb",
                   "lib/codecov_api/api/commits.rb", "lib/codecov_api/objects/base.rb",
                   "lib/codecov_api/objects/author.rb", "lib/codecov_api/objects/folder_totals.rb"]
  s.homepage    = 'http://rubygems.org/gems/codecov-api'
  s.license     = 'MIT'
end
