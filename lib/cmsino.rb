require "cmsino/version"
require "cmsino/conf"

module Cmsino
  class Engine < Rails::Engine
    # TODO 
    # enable. Fix problems with routes
    # isolate_namespace Cmsino

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
  end
end

