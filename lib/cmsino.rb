require 'bootstrap-sass'
require 'font-awesome-sass'
require 'cmsino/version'
require 'cmsino/conf'
require 'cmsino/controller_helpers'
require 'bootstrap-wysihtml5-rails'
require 'bootstrap-datepicker-rails'
require 'paperclip'
require 'simple_form'
require 'cancan'

module Cmsino
  class Engine < Rails::Engine
    # http://edgeapi.rubyonrails.org/classes/Rails/Engine.html
    # isolate_namespace Cmsino

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end

