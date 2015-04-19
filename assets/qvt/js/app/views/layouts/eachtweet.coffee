define ['marionette','jade!app/views/layouts/eachtweet'],(Marionette,template) ->
  class EachTweetView extends Marionette.Layout
    tagName : 'li'
    template: template
    initialize : ->
      console.log "eachtweet initi"
      console.log @
    onRender:->
      console.log 'eachtweet onrender'
