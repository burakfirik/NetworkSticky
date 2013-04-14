$ ->

window.selectUsers = ->
  $('#noteModal .modal-body').html ""
  $.ajax
    type: "GET"
    url: "/notes/share"
    success: (data) ->
      $('.modal-body').append data.form
    error: (data) ->
