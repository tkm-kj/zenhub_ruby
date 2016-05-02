# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zenhub_ruby'

Gem::Specification.new do |spec|
  spec.name          = "zenhub_ruby"
  spec.version       = ZenhubRuby::VERSION
  spec.authors       = ["Takumi Kaji"]
  spec.email         = ["ivezuki3@gmail.com"]

  spec.summary       = %q{Ruby client of ZenHub API.}
  spec.description   = %q{Ruby client of ZenHub API.}
  spec.homepage      = 'https://github.com/tkm-kj/zenhub_ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
