# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gridr/version'

Gem::Specification.new do |spec|
  spec.name          = 'gridr'
  spec.version       = Gridr::VERSION
  spec.authors       = ['Vladimir Melnick']
  spec.email         = ['egotraumatic@gmail.com']
  spec.summary       = %q{console CSS grid generator}
  spec.description   = %q{console CSS grid generator}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.99'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'simplecov', '~> 0.7.1'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.3.0'
  spec.add_development_dependency 'mutant-rspec'
end
