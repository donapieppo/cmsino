require 'singleton'

module Cmsino
  class Conf
    include Singleton

    attr_accessor :locales
    attr_accessor :pages

    def self.setup(&block)
      block.call Conf.instance
    end

    def initialize
      @locales = ['it']
      @pages = YAML.load_file(File.join(Rails.root, "config", "cmsino.yml"))
    end

    def page(name)
      @pages[name]
    end
     
  end
end

