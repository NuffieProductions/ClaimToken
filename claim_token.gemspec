# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'claim_token/version'

Gem::Specification.new do |spec|
  spec.name          = "claim_token"
  spec.version       = ClaimToken::VERSION
  spec.authors       = ["Daniel Zollinger"]
  spec.email         = ["daniel.zollinger@crichq.com"]
  spec.description   = %q{ClaimToken encrypts and signs tokens to be used in a claim-based authentication system}
  spec.summary       = %q{Encrypt heem! Sign heem! Claim heem!}
  spec.homepage      = "http://github.com/NuffieProductions/ClaimToken"
  spec.license       = "Apache 2.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
