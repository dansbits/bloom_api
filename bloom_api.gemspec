# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bloom_api/version'

Gem::Specification.new do |spec|
  spec.name          = "bloom_api"
  spec.version       = BloomApi::VERSION
  spec.authors       = ["Daniel Carpenter"]
  spec.email         = ["daniel.carpenter01@gmail.com"]
  spec.summary       = %q{A gem for retrieving data from the Bloom API.}
  spec.description   = %q{A ruby gem for accessing data from any instance of the Bloom API. For more informatoin, visit http://www.bloomapi.com/}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
