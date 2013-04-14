# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.btn-shownote').click ->
    showNote(this)
  $('.btn-editnote').click ->
    editNote(this)

window.showNote = (link) ->
<<<<<<< HEAD
  $('#noteModal .modal-body').html ""
=======
>>>>>>> 36a2f3959683644bcb532aad8e692ce805cf3d76
  $.ajax
    type: "GET"
    url: "/notes/#{$(link).attr('data-id')}.json"
    success: (data) ->
<<<<<<< HEAD
      console.log data
      $('#noteModal .note-title').text data.note.name
      if data.shared == true
        $('#noteModal .note-title').append(
          "<p><em class='label'>shared by #{data.owner}</em></p>"
        )
        $('.btn-share').remove()
      else
        if $('.btn-share').length < 1
          $('.modal-header h3').append(
            "<a href='#' class='btn btn-share' onclick='shareNote();'>Share Note</a>" 
          )

      $('#noteModal .note-title').append "<span class='note-id hide'>#{data.note.id}</span>"
      if data.contents.length == 0
        $('#noteModal .modal-body').html "<em>Note has no contents yet.</em>"
      else
        i = 1
        for content in data.contents
          $('#noteModal .modal-body').append("<p>#{i}: #{content.description}</p>")
          i++
=======
      $('#noteModal h3').text data.name
      $('#noteModal .modal-body').html ""
      if data.contents.length == 0
        $('#noteModal .modal-body').html "<em>Note has no contents yet.</em>"
      else
        for content in data.contents
          $('#noteModal .modal-body').append("<p>#{content.description}</p>")
>>>>>>> 36a2f3959683644bcb532aad8e692ce805cf3d76
    error: (data) ->

window.editNote = (link) ->
  $.ajax
    type: "GET"
    url: "/notes/#{$(link).attr('data-id')}/edit"
    success: (data) ->
      $('#noteModal .modal-body').html data
    error: (data) ->
<<<<<<< HEAD

window.shareNote = ->
  $('#noteModal .modal-body').html ""
  $.ajax 
    type: "GET"
    url: "/notes/share"
    success: (data) ->
      $('.modal-body').html data.form
    error: (data) ->

window.createSharedNote = ->
  email = $('#shared_note_email').val()
  noteID = $('span.note-id').text()
  data_ = "email=" + email + "&shared_note[note_id]=" + noteID
  $.ajax
    type: "POST"
    url: "/shared_notes?" + data_
    success: (data) ->
      if data.status == "success"
        $('.modal-body').html "Successfully shared \"#{data.note.name}\" to #{email}"
      else
        $('.modal-body').html data.error_description
    error: (data) ->
=======
>>>>>>> 36a2f3959683644bcb532aad8e692ce805cf3d76
