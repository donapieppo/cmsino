class Cmsino::Page

  attr_reader :name, :description

  def initialize(name)
    # TODO reread in development... only once in production
    @conf = YAML.load_file(File.join(Rails.root, "config", "cmsino.yml"))
    Rails.logger.debug(@conf.inspect)
    @snippets = @conf['snippet']

    @name = name 
    @description = @conf['page'][name.to_s]
  end

  def content(name)
    Cmsino::Content.find_or_create_by_page_and_name(@name, name)
  end

end

