# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cryptorub/version'

Gem::Specification.new do |spec|
  spec.name          = "cryptorub"
  spec.version       = Cryptorub::VERSION
  spec.authors       = ["Solal Hagege"]
  spec.email         = ["solalhagege@gmail.com"]

  spec.summary       = %q{Gem that gives you all the asset prices of your favorite cryptocurrency
                          supported by the exchange Coinbase (BTC, ETH and LTC).}
  spec.homepage      = "TODO: https://github.com/SHagege/cryptorub."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "trollop", "~> 2.1.2"
  spec.add_development_dependency "colorize", "~> 0.8.1"
  spec.add_development_dependency "looksee", "~> 4.0.0"
  spec.add_development_dependency "coinbase", "~> 4.1.0"
  spec.add_development_dependency "ncypher", "~> 0.6.1"
end
