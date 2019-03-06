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

  spec.add_dependency "rails", "~> 5.2.2"

  spec.add_dependency 'mysql2'
  spec.add_dependency 'sassc-rails'
  spec.add_dependency 'bootsnap'
  spec.add_dependency 'mini_magick'
  spec.add_dependency 'pundit'
  spec.add_dependency 'simple_form'
  spec.add_dependency 'bootstrap-sass'
  spec.add_dependency 'font-awesome-sass'
  spec.add_dependency 'jquery-rails'

  #spec.add_dependency 'bootstrap-wysihtml5-rails'
  #spec.add_dependency 'bootstrap-datepicker-rails'
  #spec.add_dependency 'paperclip'
  
  # spec.add_development_dependency 'rspec-rails'
  # spec.add_development_dependency 'factory_girl_rails'
  # spec.add_development_dependency 'database_cleaner'

end

