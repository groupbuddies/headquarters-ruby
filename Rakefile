require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'
RuboCop::RakeTask.new
RSpec::Core::RakeTask.new(:spec)

task default: [:rubocop, :spec]

task :console do
  require 'pry'
  require 'headquarters'
  ARGV.clear
  Pry.start
end
