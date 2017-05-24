# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "reevoo_sapience/version"

Gem::Specification.new do |spec|
  spec.name          = "reevoo_sapience"
  spec.version       = ReevooSapience::VERSION
  spec.authors       = ["Mikael Henriksson", "Alex Malkov"]
  spec.email         = ["mika@reevoo.com", "alex.malkov@reevoo.com"]

  spec.summary       = "Centralizd sapience configuration for Reevoo Ltd."
  spec.description   = "Centralizd sapience configuration for Reevoo Ltd. See README.md for more information"
  spec.homepage      = "https://github.com/reevoo/reevoo_sapience-rb"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    fail "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(/^(test|spec|features)\//) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(/^exe\//) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sapience", "~> 2.2"
  spec.add_dependency "dogstatsd-ruby", "~> 2.2"
  spec.add_dependency "sentry-raven", "~> 2.3"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "reevoocop"
  spec.add_development_dependency "fuubar"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-json"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "gem-release"
end
