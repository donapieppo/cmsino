cmsino_edited_url = ''
$ ->
  $(".cmsino_editable").mouseenter( ->
    $(this).css('opacity', '0.3')
    $(this).find('.cmsino-help').css('display', 'block').css('opacity', '1')
  ).mouseleave( ->
    $(this).css('opacity', '1')
    $(this).find('.cmsino-help').css('display', 'none')
  )
  $("#cmsino-modal").on("show.bs.modal", (e) -> 
    $(this).find(".modal-body").load(cmsino_edited_url, -> 
      $('#cmsino_content_text').wysihtml5(toolbar: {blockquote: false, html: true})
      $('#cmsino_post_text').wysihtml5(toolbar: {blockquote: false, html: true})
    )
  ).on("hide.bs.modal", (e) ->
    $(this).find(".modal-body").html("");
  )
  $(".cmsino_editable").dblclick( (event) ->
    cmsino_edited_url = $(this).attr('data-editor')
    $("#cmsino-modal").modal('show')
  )

