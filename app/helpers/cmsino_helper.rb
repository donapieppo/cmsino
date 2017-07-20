module CmsinoHelper

  def display_editable_content(content, edit_url)
    text = (content and ! content.text.blank?) ? content.text : "edit me"

    return text.html_safe unless edit_url

    # capture do 
    #   content_tag(:div, class: 'cmsino_editable', data: { editor: edit_url }) do
    #     "&nbsp;".html_safe +
    #       content_tag(:div, class: 'cmsino-help') do
    #       'Double click to edit'
    #     end + text.html_safe
    #   end
    # end
    capture do 
      content_tag(:div, class: 'cmsino_editable', data: { editor: edit_url }, rel: 'popover') do
        text.html_safe
      end
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
    content = page.content(name, I18n.locale)

    edit_url = can?(:update, content) ? edit_cmsino_content_path(content) : nil
    display_editable_content(content, edit_url)

    # editable_tags = ''
    # visible_content = content.text
    # if can?(:update, content) 
    #   editable_tags = %Q|class="cmsino_editable" data-editor="#{edit_cmsino_content_path(content)}"|
    #   visible_content = 'edit me' if visible_content.blank?
    # end

    # raw %Q|
    #   <div #{editable_tags} id="#{content.div_id}">&nbsp;
    #     <div class="cmsino-help">Double click to edit</div>
    #     #{visible_content}
    #   </div>|
  end

  def selectable_image(name, style: '', cssclass: '' )
    content = Cmsino::Content.find_or_create_by(name: name, locale: I18n.locale)

    if can?(:update, content) 
      editable_tags = %Q|class="cmsino_editable" data-editor="#{cmsino_content_media_path(content)}"|
    end

    res = ''
    content.cmsino_media.each do |medium|
      res += %Q|
        <div #{editable_tags} id="#{medium.id}">&nbsp;
          <div class="cmsino-help">Double click to edit</div>
          <img src="#{medium.attach.url}" style="#{style}" class="#{cssclass}"/>
        </div>|
    end
    res.html_safe
  end

  # POSTS

  def editable_posts(name, description = nil)
    @cmsino_posts ||= Hash.new
    @cmsino_posts[name] = Cmsino::Post.where(umbrella: name).includes(:cmsino_media).order('date desc')
  end

  def icon(name, options = { text: "", size: "18" })
    raw "<i style=\"font-size: #{options[:size]}px\" class=\"fa fa-#{name}\"></i> #{options[:text]}"
  end

  # MEDIA

  # obj = content or array o media
  # pass content variable if want to give chance to add media to the content
  def ul_media(obj, content = nil)
    media = (obj.is_a? Cmsino::Content) ? obj.cmsino_media : obj # array of media
      
    content_tag :ul, class: 'row' do
      content_tag_for :li, media, class: 'thumbnail col-sm-6 col-md-4' do |media|
        delete_path = (obj.is_a? Cmsino::Content) ? (cmsino_media_use_path(obj.cmsino_media_uses.where(cmsino_medium_id: media.id).first)) : "#" 

        image_tag(media.attach.url(:medium), height: 150) +

        content_tag(:div, class: "caption") do
          content_tag(:h4,  class: "media-heading") { media.name } +
          content_tag(:p) { media.description } +
          content_tag(:p) { link_to(icon('trash'), delete_path , method: :delete) unless content } +
          content_tag(:p) { link_to(icon('plus'), new_cmsino_media_use_path(content, medium_id: media.id)) if content }
        end
      end
    end
  end

  def umbrella_div_id(umbrella)
    "umbrella_#{umbrella}"
  end

  def icon(name, options = { text: "", size: "18" })
    raw "<i style=\"font-size: #{options[:size]}px\" class=\"fa fa-#{name}\"></i> #{options[:text]}"
  end

  def cmsino_header
    render partial: 'cmsino/layouts/cmsino_header'
  end
end

