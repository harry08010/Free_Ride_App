radios = $('.option').find('input')
for r in radios
  if r.checked
    $(r).parent().addClass('selected')
$('.option').on 'click', () ->
  $el = $(@)
  $el.siblings().removeClass('selected')
  $el.addClass('selected');
  $el.find('input').first().prop('checked', true)
