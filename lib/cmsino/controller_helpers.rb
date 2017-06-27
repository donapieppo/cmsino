module Cmsino
  module ControllerHelpers

    def available_locales
      @all_locales = Cmsino::Conf.instance.locales
    end
    
    # in controller and view you have now @cmsino_page
    def editable_page(name, description = nil)
      @cmsino_page = Cmsino::Page.new(name, description)
    end

  end
end



