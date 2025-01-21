# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "randewoo_russian_workdays"
  spec.version       = '1.0.0'
  spec.authors       = ["randewoo"]
  spec.email         = ["randewoo@gmail.com"]

  spec.summary       = "Russian workdays. Fork of russian_workdays."
  spec.description   = "Производственный календарь РФ. Форк гема russian_workdays"
  spec.homepage      = "https://github.com/Randewoo-Tech/russian_workdays"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 3.0'

  spec.add_development_dependency "bundler", "~> 2.6"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.10"
end
