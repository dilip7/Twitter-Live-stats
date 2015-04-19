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
      require ['cs!app/qvt','cs!app/views/layouts/content','cs!app/views/collections/tweets','cs!app/collections/tweets'] , (QVT,ContentLayout,TweetsView,TweetsCollection) ->
        tweetscollection = new TweetsCollection(stats)
        #QVT.container.tweetslist.show(new TweetsView({collection:stats}))
        #QVT.container.currentView.regions.tweetslist.show(new TweetsView({collection:tweetscollection}))
        #QVT.container.show(new ContentLayout({collection:tweetscollection}))
        contentlayout = new ContentLayout()
        contentlayout.render()
        QVT.container.show contentlayout
        contentlayout.tweetslist.show(new TweetsView({collection:tweetscollection}))

  new AppHelper()
