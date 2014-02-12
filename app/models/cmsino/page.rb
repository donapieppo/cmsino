class Cmsino::Page
  attr_reader :name, :description

  def initialize(name)
    @name = name
    @description = @conf.page(name)
  end

  def content(name, locale)
    Cmsino::Content.find_or_create_by(:page => @name, :name => name, validate_locale(locale))
  end

  def image_content(name)
    Cmsino::ImageContent.find_or_create_by(:page => @name, :name => name)
  end

  def self.description(name)
    Cmsino::Conf.instance.page(name)
  end

  def validate_locale(locale)
    Cmsino::Conf.locales.include?(locale) ? locale : 'en'
  end
end

