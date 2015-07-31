module CmsinoHelper
  # in controller and view you have now @cmsino_page
  def editable_page(name)
    @cmsino_page = Cmsino::Page.new(name)
  end

  # display the current content. Eventually creates it if content with the
  # name and locale doesen't exists. 
  # Can pass page_name (example editable_content(:main, :home)
  def editable_content(name, page = nil)
    page = page ? Cmsino::Page.new(page) : @cmsino_page
    if ! page
      raise "FIXME trovare cmsino_page da snippet name quando possibile"
    end
    content = page.content(name, I18n.locale)

    editable_tags = ''
    visible_content = content.text
    if can?(:update, content) 
      editable_tags = %Q|class="cmsino_editable" data-editor="#{edit_cmsino_content_path(content)}"|
      visible_content = 'edit me' if content.text.blank?
    end

    raw %Q|<div class="cmsino-help">Shift + click to edit</div><div #{editable_tags} id="#{content.div_id}">#{visible_content}</div>|
  end

  def editable_image_content(name, page = nil)
    page = page ? Cmsino::Page.new(page) : @cmsino_page
    if ! page
      raise "FIXME trovare cmsino_page da snippet name quando possibile"
    end
    image_content = page.image_content(name)
    raw %Q|<h4>#{content.title}</h4>#{content.text}|
  end

end

