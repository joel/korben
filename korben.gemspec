# -*- encoding: utf-8 -*-
require File.expand_path('../lib/korben/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joel AZEMAR"]
  gem.email         = ["joel.azemar@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "korben"
  gem.require_paths = ["lib"]
  gem.version       = Korben::VERSION
end
