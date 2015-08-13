//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-wysihtml5
//= require bootstrap-datepicker

$ ->
  $(".cmsino_editable").dblclick( -> 
    url = $(this).attr('data-editor');
    window.location =  url
  )
  $('#cmsino_content_text').wysihtml5(toolbar: {blockquote: false, html: true})
  $('#cmsino_post_text').wysihtml5(toolbar: {blockquote: false, html: true})

