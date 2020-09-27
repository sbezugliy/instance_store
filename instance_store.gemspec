# frozen_string_literal: true

require_relative 'lib/instance_store/version'

Gem::Specification.new do |spec|
  spec.name          = 'instance_store'
  spec.version       = InstanceStore::VERSION
  spec.authors       = ['Sergey']
  spec.email         = ['s.bezugliy@codenv.top']

  spec.summary       = 'Ruby instance containerization library, providing tools \
for preinitialization and managemant, cloning and duplication of objects. WIP, draft.'
  spec.description   = 'Ruby instance containerization library, providing tools \
for preinitialization and managemant, cloning and duplication of objects. WIP, draft.'
  spec.homepage      = 'https://codenv.top'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com'
  spec.metadata['changelog_uri'] = 'https://github.com'

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_runtime_dependency 'guard', '~> 2.16'
  spec.add_runtime_dependency 'rake', '~> 12.3'

  spec.add_development_dependency 'codecov', '~> 0.2'
  spec.add_development_dependency 'fabrication', '~> 2.21'
  spec.add_development_dependency 'faker', '~> 2.14'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency 'guard-rubocop', '~> 1.3'
  spec.add_development_dependency 'pry', '~> 0.13'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 0.92'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.43'
  spec.add_development_dependency 'simplecov', '~> 0.19'
  spec.add_development_dependency 'simplecov-console', '~> 0.7'
end
