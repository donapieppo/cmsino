class Cmsino::Page
  attr_reader :name, :description

  def initialize(name)
    @name = name
    @cmsino_conf = Cmsino::Conf.instance
    @description = @cmsino_conf.page_description(name)
  end

  def content(name, locale)
    Cmsino::Content.find_or_create_by(:umbrella => @name, :name => name, :locale => validate_locale(locale))
  end

  def image_content(name)
    Cmsino::ImageContent.find_or_create_by(:umbrella => @name, :name => name)
  end

  def validate_locale(locale)
    @cmsino_conf.locales.include?(locale.to_s) ? locale.to_s : 'en'
  end

  def self.description(name)
    Cmsino::Conf.instance.pages[name]
  end

end

