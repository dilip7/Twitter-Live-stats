define ['marionette','jade!app/views/layouts/eachstat'],(Marionette,template) ->
  class EachStatView extends Marionette.Layout
    tagName : 'li'
    template: template
    events:
      'click #fetchtweets' : 'fetchtweets'
    fetchtweets : ->
      console.log @options.model.attributes.domain
