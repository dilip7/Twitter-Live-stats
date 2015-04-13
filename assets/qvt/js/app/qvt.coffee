define ['backbone','marionette','cs!app/helpers/socket','cs!app/helpers/app'],(Backbone,Marionette,sockethelper,apphelper) ->
  QVT = new Marionette.Application()
  QVT.addRegions
    header: '#header'
    nav: '#sidebar-left'
    container: '#content'
    modals: '#modals'
  QVT.addInitializer () ->
    Backbone.history.start()
    apphelper.init()
    sockethelper.init()
  QVT
