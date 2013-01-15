class Cmsino::Page

  attr_reader :name, :title, :side

  def initialize(name)
    @conf = YAML.load_file(File.join(Rails.root, "config", "cmsino_pages.yml"))
    Rails.logger.info(@conf.inspect)
    @snippets = @conf['snippet']

    @name = name # ex description
    @page = @conf['page'][name.to_s]
    @page = @page['title']
  end

  def content(name)
    Cmsino::Content.find_or_create_by_page_and_name(@name, name)
  end

end

