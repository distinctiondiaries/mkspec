# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mkspec/version'

Gem::Specification.new do |spec|
  spec.name          = "mkspec"
  spec.version       = Mkspec::VERSION
  spec.authors       = ["Ritchie Young"]
  spec.email         = ["ritchiey@gmail.com"]
  spec.description   = %q{A DSL for generating specs}
  spec.summary       = %q{Generate a spec from your REPL using a simple, familiar DSL}
  spec.homepage      = "https://github.com/ritchiey/mkspec"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
