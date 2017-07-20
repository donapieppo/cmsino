cmsino_edited_url = ''
$ ->
  $(".cmsino_editable").tooltip({ trigger: "hover", title: "Double click to edit", placement: 'left auto', delay: 0 });
  $(".cmsino_editable").mouseenter( ->
    $(this).css('opacity', '0.3')
  ).mouseleave( ->
    $(this).css('opacity', '1')
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

