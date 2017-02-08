require_relative 'lib/codecov/api/commits.rb'
require_relative 'lib/codecov/objects/folder_totals.rb'

commits = Codecov::Api::Commits.new('hvssle', 'hassle')
puts Codecov::Objects::FolderTotals.new(commits.folder_totals('app/models')).coverage

# require_relative 'lib/codecov/api/branches.rb'
# puts Codecov::Api::Branches.new('hvssle', 'hassle').get('master')
