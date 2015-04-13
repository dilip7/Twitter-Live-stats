define ['require'],(require) ->

  class AppHelper

    init: ->
      console.log 'init'
      ###
      require ['cs!app/qvt','cs!app/views/items/nav','cs!app/views/layouts/header','cs!app/collections/notifications','cs!app/views/collections/notifications'] , (QVT,NavView,HeaderLayout,Notifications,Notificationsview) ->
        QVT.nav.show(new NavView()) unless QVT.nav.currentView?
        headerlayout = new HeaderLayout()
        headerlayout.render()
        QVT.header.show headerlayout
        notifications = new Notifications([])
        mediator.commands.execute 'setnotifications', notifications
        headerlayout.notifications.show(new Notificationsview({collection:notifications}))
      ###

  new AppHelper()
