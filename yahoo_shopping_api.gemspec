# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yahoo_shopping_api/version'

Gem::Specification.new do |spec|
  spec.name          = "yahoo_shopping_api"
  spec.version       = YahooShoppingApi::VERSION
  spec.authors       = ["kamiya54"]
  spec.email         = ["kamiya54@gmail.com"]
  spec.summary       = %q{Ruby wrapper for Yahoo Shopping API.}
  spec.description   = %q{Ruby wrapper for Yahoo Shopping API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "xml-simple"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "guard-rspec"
end
