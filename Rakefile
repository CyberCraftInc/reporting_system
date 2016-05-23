# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'rubygems'
require 'rake'
$:.unshift  File.join(File.dirname(__FILE__), "lib")

require 'rspec/core'
require 'rspec/core/rake_task'

task :default => :spec

desc "Run all specs in spec directory"
RSpec::Core::RakeTask.new(:spec)