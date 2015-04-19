define ['require','cs!app/core/mediator'],(require,mediator) ->
  class AppHelper

    init:->
      console.log 'init'
      require ['cs!app/qvt','cs!app/views/layouts/content'] , (QVT,ContentLayout) ->
        contentlayout = new ContentLayout()
        contentlayout.render()
        QVT.container.show contentlayout
      ###
      require ['cs!app/qvt','cs!app/views/layouts/content','cs!app/views/collections/stats'] , (QVT,ContentLayout,StatsView) ->
        mediator.commands.execute 'setstats', stats
        mediator.requests.request 'stats' ,(statslist) =>
          contentlayout = new ContentLayout()
          contentlayout.render()
          QVT.container.show contentlayout
          contentlayout.statslist.show(new StatsView({collection:statslist}))
       ###

    renderstats :(stats) ->
      require ['cs!app/collections/stats'] , (StatsCollection) =>
          statscollection = new StatsCollection(stats)
          mediator.events.trigger 'showstats' ,statscollection
      ###
      require ['cs!app/qvt','cs!app/views/layouts/content','cs!app/views/collections/stats','cs!app/collections/stats'] , (QVT,ContentLayout,StatsView,StatsCollection) ->
        statscollection = new StatsCollection(stats)
        #QVT.container.statslist.show(new statsView({collection:stats}))
        #QVT.container.currentView.regions.statslist.show(new statsView({collection:statscollection}))
        #QVT.container.show(new ContentLayout({collection:statscollection}))
        contentlayout = new ContentLayout()
        contentlayout.render()
        QVT.container.show contentlayout
        contentlayout.statslist.show(new StatsView({collection:statscollection}))
      ###

    gettweets : (filter) ->
      require ['cs!app/utils/ajax','cs!app/collections/tweets'] , (ajaxutil,TweetsCollection) ->
        tosend =
          domain : filter
        callback = (data) ->
          tweetscollection = new TweetsCollection(data.tweets)
          mediator.events.trigger 'showtweets' , tweetscollection
        ajaxutil.ajax 'gettweets',tosend,'POST',callback

  new AppHelper()
