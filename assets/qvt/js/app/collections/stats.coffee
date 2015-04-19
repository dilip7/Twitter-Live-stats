define ['backbone','cs!app/models/stat'],(Backbone,Stat) ->
  class Stats extends Backbone.Collection
    model:Stat
