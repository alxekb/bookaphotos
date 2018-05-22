# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#slider-range').slider
    range: true
    min: $('#slider-range').data("min")
    max: $('#slider-range').data("max")
    values: $('#slider-range').data("value")
    slide: (event, ui) ->
      $("#filter_min").val(ui.values[0])
      $("#filter_max").val(ui.values[1])
      return

  $("#datepicker").datepicker onSelect: (dateText, inst) ->
    dateAsString = dateText
    dateAsObject = $(this).datepicker('getDate')
    $("#filter_date").val(dateAsString)

    return

  $('#slider-photo-count').slider
    range: true
    min: $('#slider-photo-count').data("min")
    max: $('#slider-photo-count').data("max")
    values: $('#slider-photo-count').data("value")
    slide: (event, ui) ->
      $("#order_photo_count").val(ui.value)
      return

  $("#datepicker").datepicker('setDate', $("#filter_date").val())

$(document).on 'click', 'form .remove_fields', (event) ->
  $(this).prev('input[type=hidden]').val('1')
  $(this).closest('form-group').hide()
  event.preventDefault()

$(document).on 'click', 'form .add_fields', (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).before($(this).data('fields').replace(regexp, time))
  event.preventDefault()
return

