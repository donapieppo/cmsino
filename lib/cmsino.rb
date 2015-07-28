require 'bootstrap-sass'
require 'font-awesome-sass'
require 'devise'
require 'omniauth'
require 'omniauth-google-oauth2'
require 'cancan'
require 'cmsino/version'
require 'cmsino/conf'

module Cmsino
  class Engine < Rails::Engine
    # http://edgeapi.rubyonrails.org/classes/Rails/Engine.html
    # isolate_namespace Cmsino

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
  end
end

