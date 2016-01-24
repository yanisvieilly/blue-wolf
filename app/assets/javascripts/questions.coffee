$ ->
  $('.new_question')
    .on 'ajax:success', (e, data) ->
      createFlash "La question '#{data['title']}' a été créée avec succès.", 'success'
    .on 'ajax:error', (e, xhr, status, error) ->
      createFlash "La question n'a pas pu être créée. Erreur: #{error}", 'danger'
