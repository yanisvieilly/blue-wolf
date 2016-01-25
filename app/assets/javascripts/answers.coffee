$ ->
  $('.new_answers')
    .on 'ajax:success', (e, data) ->
      createFlash "Vos réponses ont été envoyées avec succès.", 'success'
    .on 'ajax:error', (e, xhr, status, error) ->
      createFlash "Vos réponses n'ont pas pu être transmises. Erreur: #{error}", 'danger'
