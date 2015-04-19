define ['require'],(require) ->
  class AppHelper

    init:->
      console.log 'init'
      require ['cs!app/qvt','cs!app/views/layouts/content'] , (QVT,ContentLayout) ->
        contentlayout = new ContentLayout()
        contentlayout.render()
        QVT.container.show contentlayout

    renderstats :(stats) ->
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
