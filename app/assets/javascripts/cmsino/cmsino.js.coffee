$ ->
  $(".cmsino_editable").mouseenter( ->
    $(this).css('opacity', '0.3')
    $(this).find('.cmsino-help').css('display', 'block').css('opacity', '1')
  ).mouseleave( ->
    $(this).css('opacity', '1')
    $(this).find('.cmsino-help').css('display', 'none')
  )
  $(".cmsino_editable").dblclick( (event) ->
    url = $(this).attr('data-editor')
    window.location = url
  )
