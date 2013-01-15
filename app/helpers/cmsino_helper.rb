module CmsinoHelper

  def editable_page(name)
    @page = Cmsino::Page.new(name)
  end

  def editale_content_link(content)
    if can? :update, content 
      %Q|<span><a href="#{edit_cmsino_content_path(content)}">edit</a></span> |
    else
      ""
    end
  end

  def editable_content(name)
    if ! @page
      raise "FIXME trovare page da snippet name quando possibile"
    end
    content = Cmsino::Content.find_or_create_by_page_and_name(@page.name, name)
    raw %Q|<div id="#{content.div_id}">
#{content.text}#{editale_content_link(content)}
</div>|
  end

end

