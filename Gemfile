
source ENV['GEM_SOURCE'] || 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_GEM_VERSION') ? "#{ENV['PUPPET_GEM_VERSION']}" :  '6.18.0'

gem 'puppet', puppetversion, :require => false, :groups => [:test]
if Gem::Version.new(puppetversion) > Gem::Version.new('5.0.0')
  gem 'pdk',  '>1.9.0'
end

if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('2.3.0')
  gem 'oci'
  gem 'activesupport',  '< 6.0.0'
  gem 'yard'
  gem 'rgen'
  gem 'puppet-strings'
end

group :unit_test do
  gem 'hiera-puppet-helper'
  gem 'rspec-puppet'
  gem 'rspec-puppet-utils'
  gem 'rspec-puppet-facts'
end

group 'acceptance_test' do
  gem 'bolt'
  # For tests that need the software of a specific name, we neet to have these fixes.
  # But including the git repo fails the unit tests on older puppet versions
  # gem 'puppet_litmus' ,git: 'https://github.com/enterprisemodules/puppet_litmus.git', ref: 'fix_append_cli'
  gem 'puppet_litmus'
  gem 'serverspec'
  gem 'rspec-retry'
  if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('2.0.0')
    gem 'parallel_tests', '< 2.10.0'
  else
    gem 'parallel_tests'
  end
end

group :release, :acceptance_test do
  if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('2.2.0')
    gem 'rake', '< 13.0.0'
  else
    gem 'rake'
  end
  gem 'puppet-blacksmith'
  gem 'em_tasks', :git => "https://github.com/enterprisemodules/em_tasks.git", :ref => 'hajee/ch162/start-using-latest-versions-of-litmus-again' if RUBY_VERSION > '2.1.2'
end

gem 'byebug'

group :quality do
  gem 'brakeman'
  gem 'bundle-audit'
  gem 'fasterer'
  gem 'metadata-json-lint'
  gem 'overcommit'
  gem 'puppet-lint'
  gem 'reek'
  gem 'rubocop', :require => false
  gem 'rubocop-performance' if Gem::Version.new(RUBY_VERSION) > Gem::Version.new('2.3.0')
end

group :unit_test, :acceptance_test, :publish do
  gem 'easy_type_helpers', :git => 'https://github.com/enterprisemodules/easy_type_helpers.git'
  gem 'puppetlabs_spec_helper'
end
