define ['marionette','jade!app/views/layouts/content','cs!app/views/collections/stats'],(Marionette,template,statsView) ->
  class ContentLayout extends Marionette.Layout
    template: template
    regions:
      statslist : '#statslist'


