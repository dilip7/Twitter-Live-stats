define ['marionette','jade!app/views/layouts/content','cs!app/views/collections/stats','cs!app/views/collections/tweets','cs!app/core/mediator'],(Marionette,template,StatsView,TweetsView,mediator) ->
  class ContentLayout extends Marionette.Layout
    template: template
    regions:
      statslist : '#statslist'
      tweetslist : '#tweetslist'
    initialize: ->
      @.listenTo mediator.events,'showtweets',(tweets) =>
        @tweetslist.show(new TweetsView(collection:tweets))
      @.listenTo mediator.events,'showstats',(stats) =>
        console.log 'listened to  in showstats'
        @statslist.show(new StatsView(collection:stats))
