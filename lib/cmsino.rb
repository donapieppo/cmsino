require "cmsino/version"

module Cmsino
  class Engine < Rails::Engine
    isolate_namespace Cmsino

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
  end
end
