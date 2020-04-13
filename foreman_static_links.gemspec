require File.expand_path('../lib/foreman_static_links/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'foreman_static_links'
  s.version     = ForemanStaticLinks::VERSION
  s.license     = 'GPL-3.0'
  s.authors     = ['Stephan Seitz']
  s.email       = ['s.seitz@bnotk.de']
  s.homepage    = 'https://github.com:THAR3OS/foreman_static_links'
  s.summary     = 'Foreman Plugin to provide a widget with related static links.'
  # also update locale/gemspec.rb
  s.description = 'Foreman Plugin to provide a widget with related static links.'

  s.files = Dir['{app,config,db,lib,locale}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rdoc'
end
