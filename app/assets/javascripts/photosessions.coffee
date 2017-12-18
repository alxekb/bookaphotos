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
  return
