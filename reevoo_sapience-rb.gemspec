# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reevoo_sapience/version'

Gem::Specification.new do |spec|
  spec.name          = "reevoo_sapience"
  spec.version       = ReevooSapience::VERSION
  spec.authors       = ["Mikael Henriksson", "Alex Malkov"]
  spec.email         = ["mika@reevoo.com", "alex.malkov@reevoo.com"]

  spec.summary       = %q{Handles default configuration of sapience for Reevoo Ltd.}
  spec.description   = %q{Handles default configuration of sapience for Reevoo Ltd.}
  spec.homepage      = "https://github.com/reevoo/reevoo_sapience-rb"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sapience"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-its"
end
