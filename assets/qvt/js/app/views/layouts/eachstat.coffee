define ['marionette','jade!app/views/layouts/eachstat'],(Marionette,template) ->
  class EachStatView extends Marionette.Layout
    tagName : 'li'
    template: template
    initialize : ->
      console.log "eachstat initi"
      console.log @
    onRender:->
      console.log 'eachstat onrender'
