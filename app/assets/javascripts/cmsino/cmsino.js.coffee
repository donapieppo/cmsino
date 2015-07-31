$ ->
  $(".cmsino_editable").mouseenter( ->
    $(this).prev().css('display', 'block');
  ).mouseleave( ->
    $(this).prev().css('display', 'none');
  )
  $(".cmsino_editable").click( (event) ->
    if event.shiftKey 
      url = $(this).attr('data-editor')
      window.location =  url
  )
