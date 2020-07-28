require 'rake'
require 'hanami/rake_tasks'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
rescue LoadError
end

task seed: :environment do
  UserRepository.new.create([
    { name: 'mike', position: 'dev' },
    { name: 'orest', position: 'dev' },
    { name: 'oleg', position: 'qa' },
    { name: 'tim', position: 'pm' },
    { name: 'ivan', position: 'dev' },
    { name: 'yura', position: 'pm' }
  ])
end