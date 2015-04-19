define ['require'],(require) ->
  class AppHelper

    init:->
      console.log 'init'
      require ['cs!app/qvt','cs!app/views/layouts/content'] , (QVT,ContentLayout) ->
        contentlayout = new ContentLayout()
        contentlayout.render()
        QVT.container.show contentlayout

    #not needee anymore
    sendtag:(tagstring) ->
      require ['cs!app/utils/ajax','cs!app/helpers/socket'] , (ajaxutil,sockethelper) ->
        tosend =
          trackingstring: tagstring
        callback = (data) =>
          console.log 'respose came'
          console.log data
          sockethelper.emit tagstring
        ajaxutil.ajax 'getlivestats',tosend,'POST',callback

    renderstats :(stats) ->
      console.log 'sendstats'
      require ['cs!app/qvt','cs!app/views/layouts/content','cs!app/views/collections/stats','cs!app/collections/stats'] , (QVT,ContentLayout,StatsView,StatsCollection) ->
        statscollection = new StatsCollection(stats)
        #QVT.container.statslist.show(new statsView({collection:stats}))
        #QVT.container.currentView.regions.statslist.show(new statsView({collection:statscollection}))
        #QVT.container.show(new ContentLayout({collection:statscollection}))
        contentlayout = new ContentLayout()
        contentlayout.render()
        QVT.container.show contentlayout
        contentlayout.statslist.show(new StatsView({collection:statscollection}))

  new AppHelper()
