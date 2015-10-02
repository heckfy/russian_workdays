# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'russian_workdays'
  spec.version       = '1.1.0'
  spec.authors       = ['heckfy']
  spec.email         = ['heckfyoz@gmail.com']
  spec.summary       = 'Russian workdays'
  spec.description   = 'Производственный календарь РФ'
  spec.homepage      = 'https://github.com/heckfy/russian_workdays'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
