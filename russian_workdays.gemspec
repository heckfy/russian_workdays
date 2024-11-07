# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'russian_workdays/version'

Gem::Specification.new do |spec|
  spec.name          = "russian_workdays"
  spec.version       = RussianWorkdays::VERSION
  spec.authors       = ["heckfy"]
  spec.email         = ["heckfyoz@gmail.com"]
  spec.summary       = "Russian workdays"
  spec.description   = "Производственный календарь РФ"
  spec.homepage      = "https://github.com/heckfy/russian_workdays"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.6.3'

  spec.add_development_dependency "bundler", "~> 2.4"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
