require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :push do
  puts `gem push pkg/rock_fintech-#{RockFintech::VERSION}.gem`
end

task :publish => [:build, :push]
