# encoding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "rcade_menu"
  spec.version       = "0.0.1"
  spec.authors       = ["Andrew Havens"]
  spec.email         = ["email@andrewhavens.com"]
  spec.description   = %q{A set of components for building Gosu menu screens.}
  spec.summary       = %q{A set of components for building Gosu menu screens.}
  spec.homepage      = "https://github.com/ruby-rcade/rcade_menu"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'gosu'
  spec.add_dependency 'rcade_controls'
  spec.add_dependency 'rcade_colors'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
