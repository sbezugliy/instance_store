# frozen_string_literal: true

require_relative 'lib/instantiator/version'

Gem::Specification.new do |spec|
  spec.name          = 'instantiator'
  spec.version       = Instantiator::VERSION
  spec.authors       = ['Sergey']
  spec.email         = ['s.bezugliy@codenv.top']

  spec.summary       = 'Ruby instance containerization library, providing tools \
for preinitialization and managemant, cloning and duplication of objects. WIP, draft.'
  spec.description   = 'Ruby instance containerization library, providing tools \
for preinitialization and managemant, cloning and duplication of objects. WIP, draft.'
  spec.homepage      = 'https://codenv.top'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://bitbucket.org'

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

  spec.add_runtime_dependency 'guard'
  spec.add_runtime_dependency 'rake'

  spec.add_development_dependency 'fabrication'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
end
