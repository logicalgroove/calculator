$(document).ready ->
  $('#calculator_operation').change ->
    operation = $(this).val()
    if operation == 'sqrt'
      $('#calculator_b').prop('disabled', true)
    else
      $('#calculator_b').prop('disabled', false)

  $('#new_calculator').on('ajax:success', (event, xhr, status, error) ->
    $('.form-input-hint').html ''
    showResult(xhr.result, xhr.operation, xhr.a, xhr.b)
    updateHistory(xhr.result, xhr.operation, xhr.a, xhr.b)
  ).on 'ajax:error', (event, xhr, status, error) ->
    $('.form-input-hint').html ''
    errors = xhr.responseJSON
    $.each errors, (key, value) ->
      $("input#calculator_#{key}").next().html value

showResult = (result, operation, a, b=null) ->
  $('input').val ''
  if operation == 'sqrt'
    $('.result').html "Square root of #{a} = <b>#{result}</b>"
  else
    $('.result').html "#{a} #{operation} #{b} = <b>#{result}</b>"

updateHistory = (result, operation, a, b=null) ->
  $('#calculations').prepend("<tr><td>#{a}</td><td>#{operation}</td><td>#{b}</td><td>#{result}</td></tr>")
