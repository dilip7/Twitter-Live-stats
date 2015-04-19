define ['require','cs!app/core/mediator'],(require,mediator) ->
  class AppHelper

    init:->
      console.log 'init'
      require ['cs!app/qvt','cs!app/views/layouts/content'] , (QVT,ContentLayout) ->
        contentlayout = new ContentLayout()
        contentlayout.render()
        QVT.container.show contentlayout

    renderstats :(stats) ->
      require ['cs!app/collections/stats'] , (StatsCollection) =>
          statscollection = new StatsCollection(stats)
          mediator.events.trigger 'showstats' ,statscollection

    gettweets : (filter) ->
      require ['cs!app/utils/ajax','cs!app/collections/tweets'] , (ajaxutil,TweetsCollection) ->
        tosend =
          domain : filter
        callback = (data) ->
          tweetscollection = new TweetsCollection(data.tweets)
          mediator.events.trigger 'showtweets' , tweetscollection
        ajaxutil.ajax 'gettweets',tosend,'POST',callback

  new AppHelper()
