module CmsinoHelper

  # in controller and view you have now @page
  def editable_page(name)
    @page = Cmsino::Page.new(name)
  end

  # display the 'edit' link if user has the rights
  def editable_content_link(content)
    if can? :update, content 
      %Q|<span><a href="#{edit_cmsino_content_path(content)}">edit</a></span> |
    else
      ""
    end
  end

  # display the current content. Eventually creates it if content with the
  # name doesen't exists. 
  def editable_content(name)
    if ! @page
      raise "FIXME trovare page da snippet name quando possibile"
    end
    content = Cmsino::Content.find_or_create_by_page_and_name(@page.name, name)
    raw %Q|<div id="#{content.div_id}">
#{content.text}#{editable_content_link(content)}
</div>|
  end

  def editable_image_content(name)
    if ! @page
      raise "FIXME trovare page da snippet name quando possibile"
    end
    content = Cmsino::ImageContent.find_or_create_by_page_and_name(@page.name, name)
    raw %Q|<h4>#{content.title}</h4>
#{content.text}#{editable_content_link(content)}|
  end
end

