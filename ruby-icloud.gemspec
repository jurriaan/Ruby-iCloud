# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-icloud"
  spec.version       = RubyiCloud::VERSION
  spec.authors       = ["Jurriaan Pruis"]
  spec.email         = ["email@jurriaanpruis.nl"]
  spec.description   = %q{A Ruby utility/library for connecting to Apple iCloud servicesn}
  spec.summary       = %q{A Ruby utility/library for connecting to Apple iCloud services}
  spec.homepage      = "https://github.com/jurriaan/Ruby-iCloud"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency 'httpclient', '~> 2.3'
  spec.add_dependency 'plist', '~> 3.1'
end
