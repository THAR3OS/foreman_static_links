require 'rake/testtask'

# Tasks
namespace :foreman_static_links do
  namespace :example do
    desc 'Example Task'
    task task: :environment do
      # Task goes here
    end
  end
end

# Tests
namespace :test do
  desc 'Test ForemanStaticLinks'
  Rake::TestTask.new(:foreman_static_links) do |t|
    test_dir = File.join(File.dirname(__FILE__), '../..', 'test')
    t.libs << ['test', test_dir]
    t.pattern = "#{test_dir}/**/*_test.rb"
    t.verbose = true
    t.warning = false
  end
end

namespace :foreman_static_links do
  task :rubocop do
    begin
      require 'rubocop/rake_task'
      RuboCop::RakeTask.new(:rubocop_foreman_static_links) do |task|
        task.patterns = ["#{ForemanStaticLinks::Engine.root}/app/**/*.rb",
                         "#{ForemanStaticLinks::Engine.root}/lib/**/*.rb",
                         "#{ForemanStaticLinks::Engine.root}/test/**/*.rb"]
      end
    rescue
      puts 'Rubocop not loaded.'
    end

    Rake::Task['rubocop_foreman_static_links'].invoke
  end
end

Rake::Task[:test].enhance ['test:foreman_static_links']

load 'tasks/jenkins.rake'
if Rake::Task.task_defined?(:'jenkins:unit')
  Rake::Task['jenkins:unit'].enhance ['test:foreman_static_links', 'foreman_static_links:rubocop']
end
