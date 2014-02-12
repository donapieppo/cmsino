module CmsinoHelper
  # in controller and view you have now @cmsino_page
  def editable_page(name)
    @cmsino_page = Cmsino::Page.new(name)
  end

  # display the 'edit' link if user has the rights
  def editable_content_link(content)
    if can? :update, content 
      # %Q|<span><a href="#{edit_cmsino_content_path(content)}">edit</a></span>|
      %Q|<span><a href="#{edit_cmsino_content_path(content)}"><i class='icon-edit'></i></a></span>|
    else
      ""
    end
  end

  # display the current content. Eventually creates it if content with the
  # name and locale doesen't exists. 
  # Can pass page_name (example editable_content(:main, :home)
  def editable_content(name, page = nil)
    page = page ? Cmsino::Page.new(page) : @cmsino_page
    if ! page
      raise "FIXME trovare cmsino_page da snippet name quando possibile"
    end
    # FIXME default
    # only accepted locales from config/cmsino.yml
    locale = @@conf['locales'].include?(I18n.locale.to_s) ? I18n.locale.to_s : 'it'
    content = Cmsino::Content.find_or_create_by(:page => page.name, :name => name, :locale => locale)
    raw %Q|<div id="#{content.div_id}">
#{content.text}#{editable_content_link(content)}
</div>|
  end

  def editable_image_content(name)
    if ! @cmsino_page
      raise "FIXME trovare cmsino_page da snippet name quando possibile"
    end
    content = Cmsino::ImageContent.find_or_create_by(:page => @cmsino_page.name, :name => name, :locale => I18n.locale)
    raw %Q|<h4>#{content.title}</h4>
#{content.text}#{editable_content_link(content)}|
  end
end

