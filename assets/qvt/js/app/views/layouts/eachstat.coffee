define ['marionette','jade!app/views/layouts/eachstat'],(Marionette,template) ->
  class EachStatView extends Marionette.Layout
    tagName : 'li'
    template: template
    events:
      'click #fetchtweets' : 'fetchtweets'
    fetchtweets : ->
      console.log @
      that = @
      require ['cs!app/helpers/app'],(apphelper) ->
        apphelper.gettweets that.model.attributes.domain
