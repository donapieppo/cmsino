# In database the contents in the same page have the same umbrella.
class Cmsino::Page
  attr_reader :name, :description

  def initialize(name, description = nil)
    @name = name
    @cmsino_conf = Cmsino::Conf.instance
    @description = description || name
  end

  def content(content_name, locale)
    Cmsino::Content.find_or_create_by(:umbrella => @name, :name => content_name, :locale => validate_locale(locale))
  end

  def medium_content(content_name)
    Cmsino::Medium.find_or_create_by(:umbrella => @name, :name => content_name)
  end

  def validate_locale(locale)
    @cmsino_conf.locales.include?(locale.to_s) ? locale.to_s : 'en'
  end

  # contents belongs to sabe page if have page name as umbrella
  def contents
    Cmsino::Content.where(umbrella: self.name).order(:locale)
  end

  # return has with locales as key anc contents as value
  def contents_locales_hash
    Cmsino::Content.where(umbrella: self.name).inject({}){|res,c| res[c.locale] = c; res}
  end

end

