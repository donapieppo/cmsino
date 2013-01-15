# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cmsino/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Pietro Donatini"]
  gem.email         = ["pietro.donatini@unibo.it"]
  gem.description   = %q{Cms rails gem for developers.}
  gem.summary       = %q{Adds some small cms abilities to your rails project.}
  gem.homepage      = "https://github.com/donapieppo/cmsino"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cmsino"
  gem.require_paths = ["lib"]
  gem.version       = Cmsino::VERSION
end
