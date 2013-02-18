class Cmsino::Conf

  def initialize()
    # TODO reread in development... only once in production
    @@conf = YAML.load_file(File.join(Rails.root, "config", "cmsino.yml"))
    Rails.logger.info(@@conf.inspect)
    @@conf
  end

  def page(name)
    @@conf['page'][name.to_s]
  end

  def locales
    @@conf['locales'].map(&:to_s)
  end

end

