define ['marionette','jade!app/views/layouts/eachtweet'],(Marionette,template) ->
  class EachTweetView extends Marionette.Layout
    tagName : 'li'
    template: template
    events:
      'click #fetchtweets' : 'fetchtweets'
    initialize :->
      console.log 'eachtweet initialize'
      console.log @
    fetchtweets : ->
      console.log @
      that = @
      require ['cs!app/helpers/app'],(apphelper) ->
        apphelper.gettweets that.model.attributes.domain
