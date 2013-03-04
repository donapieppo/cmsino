class Cmsino::Page
  attr_reader :name, :description, :locales

  def initialize(name)
    @name = name
    @conf = Cmsino::Conf.new
    Rails.logger.info(@conf.inspect)
    @description = @conf.page(name)
    @locales = @conf.locales
  end

  def content(name, locale)
    Cmsino::Content.find_or_create_by_page_and_name_and_locale(@name, name, locale)
  end

  def self.description(name)
    Cmsino::Conf.new.page(name)
  end
end

