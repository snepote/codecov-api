require File.expand_path('../lib/codecov_api/version', __FILE__)

Gem::Specification.new do |s|
  s.name         = 'codecov_api'
  s.date         = Time.now.strftime('%F')
  s.version      = CodecovApi::VERSION
  s.platform     = Gem::Platform::RUBY
  s.authors      = ['Sebastian Nepote']
  s.email        = 'snepote@gmail.com'
  s.homepage     = 'https://github.com/snepote/codecov_api'
  s.summary      = 'Codecov API'
  s.description  = 'Unofficial toolset to consume CodeCov\'s API'
  s.files        = Dir['{lib}/**/*.rb', 'bin/*', 'LICENSE', '*.md']
  s.require_path = 'lib'
  s.license      = 'MIT'
end
