def optional_require(file)
  begin
    require "#{file}"
  rescue LoadError
    puts "#{file} not loaded."
  end
end

import '../easy_type/lib/tasks/docs.rake' if File.exists?('../easy_type/lib/tasks/docs.rake')
optional_require 'tty/spinner'
optional_require 'puppet-lint/tasks/puppet-lint'
optional_require 'puppet-syntax/tasks/puppet-syntax'
optional_require 'puppetlabs_spec_helper/rake_tasks'
optional_require 'puppet_blacksmith/rake_tasks'
optional_require 'puppet_litmus'
optional_require 'puppet_litmus/rake_tasks'
optional_require 'bolt_spec/run'
optional_require 'em_tasks/rake_tasks'

require 'puppet_litmus/rake_tasks' if Bundler.rubygems.find_name('puppet_litmus').any?
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-syntax/tasks/puppet-syntax'
require 'puppet_blacksmith/rake_tasks' if Bundler.rubygems.find_name('puppet-blacksmith').any?
require 'github_changelog_generator/task' if Bundler.rubygems.find_name('github_changelog_generator').any?
require 'puppet-strings/tasks' if Bundler.rubygems.find_name('puppet-strings').any?

def changelog_user
  return unless Rake.application.top_level_tasks.include? "changelog"
  returnVal = nil || JSON.load(File.read('metadata.json'))['author']
  raise "unable to find the changelog_user in .sync.yml, or the author in metadata.json" if returnVal.nil?
  puts "GitHubChangelogGenerator user:#{returnVal}"
  returnVal
end

def changelog_project
  return unless Rake.application.top_level_tasks.include? "changelog"

  returnVal = nil
  returnVal ||= begin
    metadata_source = JSON.load(File.read('metadata.json'))['source']
    metadata_source_match = metadata_source && metadata_source.match(%r{.*\/([^\/]*?)(?:\.git)?\Z})

    metadata_source_match && metadata_source_match[1]
  end

  raise "unable to find the changelog_project in .sync.yml or calculate it from the source in metadata.json" if returnVal.nil?

  puts "GitHubChangelogGenerator project:#{returnVal}"
  returnVal
end

def changelog_future_release
  return unless Rake.application.top_level_tasks.include? "changelog"
  returnVal = "v%s" % JSON.load(File.read('metadata.json'))['version']
  raise "unable to find the future_release (version) in metadata.json" if returnVal.nil?
  puts "GitHubChangelogGenerator future_release:#{returnVal}"
  returnVal
end

PuppetLint.configuration.send('disable_relative')

if Bundler.rubygems.find_name('github_changelog_generator').any?
  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
    raise "Set CHANGELOG_GITHUB_TOKEN environment variable eg 'export CHANGELOG_GITHUB_TOKEN=valid_token_here'" if Rake.application.top_level_tasks.include? "changelog" and ENV['CHANGELOG_GITHUB_TOKEN'].nil?
    config.user = "#{changelog_user}"
    config.project = "#{changelog_project}"
    config.future_release = "#{changelog_future_release}"
    config.exclude_labels = ['maintenance']
    config.header = "# Change log\n\nAll notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org)."
    config.add_pr_wo_labels = true
    config.issues = false
    config.merge_prefix = "### UNCATEGORIZED PRS; GO LABEL THEM"
    config.configure_sections = {
      "Changed" => {
        "prefix" => "### Changed",
        "labels" => ["backwards-incompatible"],
      },
      "Added" => {
        "prefix" => "### Added",
        "labels" => ["feature", "enhancement"],
      },
      "Fixed" => {
        "prefix" => "### Fixed",
        "labels" => ["bugfix"],
      },
    }
  end
else
  desc 'Generate a Changelog from GitHub'
  task :changelog do
    raise <<EOM
The changelog tasks depends on unreleased features of the github_changelog_generator gem.
Please manually add it to your .sync.yml for now, and run `pdk update`:
---
Gemfile:
  optional:
    ':development':
      - gem: 'github_changelog_generator'
        git: 'https://github.com/skywinder/github-changelog-generator'
        ref: '20ee04ba1234e9e83eb2ffb5056e23d641c7a018'
        condition: "Gem::Version.new(RUBY_VERSION.dup) >= Gem::Version.new('2.2.2')"
EOM
  end
end

task :generate => ['generate:yaml', 'generate:types', 'docs']

namespace :generate do
  desc 'Generate yaml file for all types'
  task :yaml do
    require_relative './generate/yaml_generator'
    #
    #
    # Types for autoscaling
    #
    YamlGenerator.new(OCI::Autoscaling, 'AutoScalingConfiguration$').generate
    #
    # types for Budget services on BudgetClient
    #
    YamlGenerator.new(OCI::Budget,'Budget$').generate
    #
    # YamlGenerator.new(OCI::ContainerEngine).generate
    #
    # Types for key managemtn
    #
    YamlGenerator.new(OCI::KeyManagement, '^Key$').generate
    YamlGenerator.new(OCI::KeyManagement, '^Vault$').generate
    #
    # types for core services on VirtualNetworkClient
    #
    YamlGenerator.new(OCI::Core, 'Cpe$').generate
    YamlGenerator.new(OCI::Core, 'DhcpOptions$').generate
    YamlGenerator.new(OCI::Core, 'Drg$').generate
    YamlGenerator.new(OCI::Core, 'InternetGateway$').generate
    YamlGenerator.new(OCI::Core, 'IpSecConnection$').generate
    YamlGenerator.new(OCI::Core, 'LocalPeeringGateway$').generate
    YamlGenerator.new(OCI::Core, 'NatGateway$').generate
    YamlGenerator.new(OCI::Core, 'NetworkSecurityGroup$').generate
    YamlGenerator.new(OCI::Core, 'RemotePeeringConnection$').generate
    YamlGenerator.new(OCI::Core, 'RouteTable$').generate
    YamlGenerator.new(OCI::Core, 'SecurityList$').generate
    YamlGenerator.new(OCI::Core, 'ServiceGateway$').generate
    YamlGenerator.new(OCI::Core, '^Subnet$').generate
    YamlGenerator.new(OCI::Core, 'Vcn$').generate
    YamlGenerator.new(OCI::Core, 'VirtualCircuit$').generate
    YamlGenerator.new(OCI::Core, 'IPSecConnection$').generate
    YamlGenerator.new(OCI::Core, 'PublicIp$').generate
    #
    # types for core services on ComputeClient
    #
    YamlGenerator.new(OCI::Core, 'AppCatalogSubscription$').generate
    YamlGenerator.new(OCI::Core, 'DedicatedVmHost$').generate
    YamlGenerator.new(OCI::Core, 'Image$').generate
    YamlGenerator.new(OCI::Core, 'Instance$').generate
    YamlGenerator.new(OCI::Core, 'InstanceConsoleConnection$').generate
    YamlGenerator.new(OCI::Core, 'InstancePool$').generate
    YamlGenerator.new(OCI::Core, 'InstanceConfiguration$').generate
    #
    # types for core services on BlockstorageClient
    #
    YamlGenerator.new(OCI::Core, 'BootVolume$').generate
    YamlGenerator.new(OCI::Core, 'BootVolumeBackup$').generate
    YamlGenerator.new(OCI::Core, 'Volume$').generate
    YamlGenerator.new(OCI::Core, 'VolumeBackup$').generate
    YamlGenerator.new(OCI::Core, 'VolumeBackupPolicy$').generate
    YamlGenerator.new(OCI::Core, 'VolumeGroup$').generate
    YamlGenerator.new(OCI::Core, 'VolumeGroupBackup$').generate
    #
    # types for Database services
    #
    YamlGenerator.new(OCI::Database, 'AutonomousDatabase$').generate
    YamlGenerator.new(OCI::Database, 'DbSystem$').generate
    YamlGenerator.new(OCI::Database, 'Database$').generate
    #
    # types for Identity services on IdentityClient
    #
    YamlGenerator.new(OCI::Identity, '^Compartment$').generate
    YamlGenerator.new(OCI::Identity, '^DynamicGroup$').generate
    YamlGenerator.new(OCI::Identity, '^Group$').generate
    YamlGenerator.new(OCI::Identity, '^IdentityProvider$').generate
    YamlGenerator.new(OCI::Identity, '^Policy$').generate
    YamlGenerator.new(OCI::Identity, '^TagNamespace$').generate
    YamlGenerator.new(OCI::Identity, '^Tag$').generate
    YamlGenerator.new(OCI::Identity, '^TagDefault$').generate
    YamlGenerator.new(OCI::Identity, '^User$').generate
    #
    # Object storage
    #
    YamlGenerator.new(OCI::ObjectStorage, '^Bucket$').generate
    #
    # File systems
    #
    YamlGenerator.new(OCI::FileStorage, '^FileSystem$').generate
    YamlGenerator.new(OCI::FileStorage, '^Export$').generate
    YamlGenerator.new(OCI::FileStorage, '^MountTarget$').generate
  end

  task :types do
    require_relative './generate/type_generator'
    TypeGenerator.new.generate
  end
end


desc "Run Litmus setup"
task :litmus do
  Rake::Task['litmus:provision'].invoke('docker_exp', 'enterprisemodules/acc_base', '-h oci_config')
  proj_root = File.expand_path(File.join(File.dirname(__FILE__)))
  node_name = YAML.load_file("#{proj_root}/inventory.yaml").dig('groups',0,'nodes',0, 'name')
  ENV['TARGET_HOST'] = node_name
  Rake::Task['litmus:install_agent'].invoke
  Rake::Task['litmus:install_module'].invoke
  Rake::Task['litmus:prepare'].invoke(node_name)
end

namespace :litmus do
  desc "Prepare the system for the tests"
  task :prepare do
    include BoltSpec::Run
    extend PuppetLitmus::Serverspec
    # Project root
    proj_root = File.expand_path(File.join(File.dirname(__FILE__)))
    puts `docker exec #{ENV['TARGET_HOST']} yum install git which -y`
    puts `docker exec #{ENV['TARGET_HOST']} /opt/puppetlabs/puppet/bin/gem install specific_install --no-ri --no-rdoc`
    puts `docker exec #{ENV['TARGET_HOST']} /opt/puppetlabs/puppet/bin/gem specific_install -l https://github.com/enterprisemodules/oci-ruby-sdk.git`
    if ENV['OCI_TENANT_INFO'] 
      bolt_upload_file(ENV['OCI_TENANT_INFO'], '/root/tenant_setup.pp')
    else
      bolt_upload_file(File.expand_path('~/software/tenant_setup.pp'), '/root/tenant_setup.pp')
    end
  end
end

Puppet[:vardir] = '/tmp'