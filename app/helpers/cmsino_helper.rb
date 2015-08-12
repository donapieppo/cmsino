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
      visible_content = 'edit me' if visible_content.blank?
    end

    raw %Q|<div #{editable_tags} id="#{content.div_id}"><div class="cmsino-help">Shift + click to edit</div>#{visible_content}</div>|
  end

  def editable_image_content(name, page = nil)
    page = page ? Cmsino::Page.new(page) : @cmsino_page
    if ! page
      raise "FIXME trovare cmsino_page da snippet name quando possibile"
    end
    image_content = page.image_content(name)
    raw %Q|<h4>#{content.title}</h4>#{content.text}|
  end

  # POSTS

  def editable_posts(name)
    @cmsino_posts ||= Hash.new
    @cmsino_posts[name] = Cmsino::Post.where(umbrella: name).order('date desc')
  end

  def icon(name, options = { :text => "", :size => "18" })
    raw "<i style=\"font-size: #{options[:size]}px\" class=\"fa fa-#{name}\"></i> #{options[:text]}"
  end
end

