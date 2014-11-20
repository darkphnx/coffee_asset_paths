# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coffee_asset_paths/version'

Gem::Specification.new do |spec|
  spec.name          = "coffee_asset_paths"
  spec.version       = CoffeeAssetPaths::VERSION
  spec.authors       = ["Dan Wentworth"]
  spec.email         = ["dan@atechmedia.com"]
  spec.summary       = %q{Little helper to allow you to access your rails asset paths from coffescript.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency "actionview", ">= 3.2", "< 5.0"
end
