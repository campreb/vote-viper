# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '#trigger_bulk_add_responders', ->
  $('#responders_import_file').trigger('click')

$(document).on 'change', '#responders_import_file', ->
  $(this).parent().submit()
