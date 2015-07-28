//= require jquery
//= require jquery_ujs
//= require wysihtml5/wysihtml5-0.3.0.min
//= require wysihtml5/bootstrap-wysihtml5

$ ->
  $(".cmsino_editable").dblclick( -> 
    url = $(this).attr('data-editor');
    window.location =  url
  )
