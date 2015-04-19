define ['marionette','jade!app/views/layouts/content','cs!app/views/collections/tweets'],(Marionette,template,TweetsView) ->
  class ContentLayout extends Marionette.Layout
    template: template
    regions:
      tweetslist : '#tweetslist'


