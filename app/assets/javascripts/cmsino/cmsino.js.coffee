$ ->
  $(".cmsino_editable").dblclick( -> 
    url = $(this).attr('data-editor');
    window.location =  url
  )
