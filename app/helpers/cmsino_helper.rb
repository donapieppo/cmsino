module CmsinoHelper

  # in controller and view you have now @cmsino_page
  def editable_page(name, description = nil)
    @cmsino_page = Cmsino::Page.new(name, description)
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

    raw %Q|<div #{editable_tags} id="#{content.div_id}">&nbsp;<div class="cmsino-help">Double click to edit</div>#{visible_content}</div>|
  end

  def editable_image(name, page = nil)
    page = page ? Cmsino::Page.new(page) : @cmsino_page
    if ! page
      raise "FIXME trovare cmsino_page da snippet name quando possibile"
    end
    image = page.medium(name)

    editable_tags = ''
    if can?(:update, image) 
      editable_tags = %Q|class="cmsino_editable" data-editor="#{edit_cmsino_medium_path(image)}"|
    end

    raw %Q|<div #{editable_tags} id="#{image.id}">&nbsp;<div class="cmsino-help">Double click to edit</div><img src="#{image.attach.url}"/></div>|
    # link_to(image.name, edit_cmsino_medium_path(image)) +
    # %Q|<img src="#{image.attach.url}"/><div class="cmsino-help">Double click to edit</div>#{visible_content}<div>|.html_safe
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
      
    content_tag :ul, class: 'media-list' do
      content_tag_for :li, media, class: 'media' do |media|
        delete_path = (obj.is_a? Cmsino::Content) ? (cmsino_media_use_path(obj.cmsino_media_uses.where(cmsino_medium_id: media.id).first)) : "#" 

        content_tag(:div, class: "media-left") do
          link_to image_tag(media.attach.url(:thumb)), "#", class: "media-object"
        end <<
        content_tag(:div, class: "media-body") do
          content_tag(:h4,  class: "media-heading") { media.name } +
          content_tag(:p) { media.description } +
          content_tag(:p) { link_to(icon(:trash), delete_path , method: :delete) unless content } +
          content_tag(:p) { link_to(icon('plus'), new_cmsino_content_media_use_path(content, medium_id: media.id)) if content }
        end
      end
    end
  end

  def umbrella_div_id(umbrella)
    "umbrella_#{umbrella}"
  end

  def available_locales
    @all_locales = Cmsino::Conf.instance.locales
  end

  def icon(name, options = { text: "", size: "18" })
    raw "<i style=\"font-size: #{options[:size]}px\" class=\"fa fa-#{name}\"></i> #{options[:text]}"
  end
end

