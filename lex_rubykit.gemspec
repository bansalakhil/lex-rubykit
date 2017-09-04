# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lex_rubykit/version'

Gem::Specification.new do |spec|
  spec.name          = "lex_rubykit"
  spec.version       = LexRubykit::VERSION
  spec.authors       = ["Akhil Bansal"]
  spec.email         = ["bansalakhil30.10@gmail.com"]
  spec.summary       = %q{AWS Lex Ruby Kit}
  spec.description   = %q{LEX Ruby Kit with examples}
  spec.homepage      = 'https://github.com/bansalakhil/lex-rubykit'
  spec.license       = "MIT"
  spec.files         = Dir['[A-Z]*'] + Dir['lib/**/*'] + Dir['tests/**'] + Dir['bin/**']
  spec.files.reject!   { |fn| fn.include? ".gem" }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency 'bundler', '~> 1.7'
  spec.add_runtime_dependency 'rake'
  spec.add_runtime_dependency 'hashie'
  spec.add_development_dependency 'rspec', '~> 3.2', '>= 3.2.0'
  spec.add_development_dependency 'rspec-mocks', '~> 3.2', '>= 3.2.0'
end
