$(document).on 'turbolinks:load', ->
  $('.update_campaign input').bind 'blur', ->
    $('.update_campaign').submit()

  $('.update_campaign').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'PUT'
        dataType: 'json',
        data: $(".update_campaign").serialize()
        success: (data, text, jqXHR) ->
          M.toast({html: 'Campanha atualizada', classes: 'green', 4000})
        error: (jqXHR, textStatus, errorThrown) ->
          M.toast({html:'Problema na atualização da Campanha', classes: 'red', 4000})
    return false

  $('.remove_campaign').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'DELETE'
        dataType: 'json',
        data: {}
        success: (data, text, jqXHR) ->
          $(location).attr('href','/campaigns');
        error: (jqXHR, textStatus, errorThrown) ->
          M.toast({html:'Problema na remoção da Campanha', classes: 'red', 4000})
    return false

  $('.raffle_campaign').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'POST'
        dataType: 'json',
        data: {}
        success: (data, text, jqXHR) ->
          M.toast({html: 'Tudo certo, em breve os participantes receberão um email!', classes: 'green', 4000})
        error: (jqXHR, textStatus, errorThrown) ->
          M.toast(html: jqXHR.responseText, classes: 'red', 4000)
    return false