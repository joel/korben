# -*- encoding: utf-8 -*-
require File.expand_path('../lib/korben/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Joel AZEMAR']
  gem.email         = ['joel.azemar@gmail.com']
  gem.description   = %q{Simple helper for configuration}
  gem.summary       = %q{Simple helper for Rails App configuration}
  gem.homepage      = 'https://github.com/joel/korben'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'korben'
  gem.require_paths = ['lib']
  gem.version       = Korben::VERSION
  
  gem.add_development_dependency 'rspec'
  gem.add_runtime_dependency 'activesupport'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end