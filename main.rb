require_relative 'lib/codecov/api/commits.rb'
require_relative 'lib/codecov/objects/folder_totals.rb'

commit_api = Codecov::Api::Commits.new('hvssle', 'hassle')
puts Codecov::Model::FolderTotals.new(commit_api.folder_totals('app/models')).coverage
