define ['marionette','jade!app/views/layouts/eachtweet'],(Marionette,template) ->
  class EachTweetView extends Marionette.Layout
    tagName : 'li'
    className: ''
    template: template
    fetchtweets : ->
      that = @
      require ['cs!app/helpers/app'],(apphelper) ->
        apphelper.gettweets that.model.attributes.domain
    templateHelpers:
      getTweetLink:() ->
        url  = "https://twitter.com/" + @user.screen_name + "/status/" + @id_str
        url

