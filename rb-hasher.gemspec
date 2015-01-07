# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rb/hasher/version'

Gem::Specification.new do |spec|
  spec.name          = "rb-hasher"
  spec.version       = Rb::Hasher::VERSION
  spec.authors       = ["RunawayBit"]
  spec.email         = ["victor.guzman@runawaybit.com"]
  spec.summary       = %q{Transform an strings array to integer}
  spec.description   = %q{Takes an strings array, join the values in a single string and return the hash value of the generated string}
  spec.homepage      = ""
  spec.license       = ""

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "murmurhash3", "~> 0.1.4"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', "~> 3.1.0"
end
