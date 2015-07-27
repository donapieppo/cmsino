# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cmsino/version'

Gem::Specification.new do |spec|
  spec.name          = "cmsino"
  spec.version       = Cmsino::VERSION
  spec.authors       = ["Pietro Donatini"]
  spec.email         = ["pietro.donatini@unibo.it"]
  spec.description   = %q{Cms rails gem for developers.}
  spec.summary       = %q{Adds some small cms abilities to your rails project.}
  spec.homepage      = "https://github.com/donapieppo/cmsino"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.2.3"

  spec.add_dependency 'cancan'
  spec.add_dependency 'simple_form'
  spec.add_dependency 'bootstrap-sass'
  spec.add_dependency 'font-awesome-sass'
  spec.add_dependency 'sass-rails', '~> 5.0'
  
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'factory_girl_rails'
  spec.add_development_dependency 'database_cleaner'

end

