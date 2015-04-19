define ['backbone','cs!app/models/tweet'],(Backbone,Tweet) ->
  class Tweets extends Backbone.Collection
    model:Tweet
