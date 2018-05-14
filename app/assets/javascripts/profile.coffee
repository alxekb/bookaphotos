#$('a[data-toggle=modal]').on 'click', ->
#  $('.dropdown').removeClass('open')
## this sets up the ajax loader, and it will stay until the method specific js removes it
#$('a[data-target="#cardModal"]').on 'click', (e)->
#  e.preventDefault()
#  e.stopPropagation()
#  $('body').modalmanager('loading')
#  $.rails.handleRemote( $(this) )
##removes whatever is in the modal body content div upon clicking close/outside modal
#$(document).on 'click', '[data-dismiss=modal], .modal-scrollable', ->
#  $('.modal-body').empty()
#$(document).on 'click', '#cardModal', (e) ->
#  e.stopPropagation()