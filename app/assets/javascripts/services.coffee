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
      return $.get('/services.json')
  })
###

services = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  prefetch:'/services/index.json'
})

services.clearPrefetchCache()
services.initialize()

start_service_typeahead_f = ->
  $('#service-name .typeahead').typeahead(null, {
    displayKey: 'text',
    source: services.ttAdapter()
  })

###start_typeahead_f = ->
  $('#service-name .typeahead').typeahead(null, {
    displayKey: 'text',
    source: (query)->
      return $.get('/services/index.json')
  })###

$(document).on 'turbolinks:load', ->
  start_service_typeahead_f()