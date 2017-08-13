# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


###start_typeahead_f = ->
  $('#service-name .#service-name .typeahead').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  }, {
    name: 'services',
    source: (query)->
      return $.get('/services/index.json')
  })
###

services_names = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  prefetch:'/services/index.json'
})
services_names.clearPrefetchCache()
services_names.initialize()

###type_func = ->
  arr = $('#service-type .typeahead').attr('data-types')
  console.log('local ' + arr)###

types = ["диагностика","ремонт двигателя","работы по ходовой части","работы по электрической части","регламентное техобслуживание","кузовные работы","шиномонтаж","дополнительные услуги"]
#console.log types

service_types = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  local: types
})
service_types.initialize()

service_name_typeahead_f = ->
  $('#service-name .typeahead').typeahead(null, {
    displayKey: 'name',
    source: services_names.ttAdapter()
  })

service_type_typeahead_f = ->
  $('#service-type .typeahead').typeahead(null, {
    #displayKey: 'text',
    source: service_types.ttAdapter()
  })

$(document).on 'turbolinks:load', ->
  #type_func()
  service_name_typeahead_f()
  service_type_typeahead_f()
