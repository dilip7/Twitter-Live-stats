define ['require'],(require) ->
  class AppHelper
    init: ->
      console.log 'init'
      require ['cs!app/qvt','cs!app/views/layouts/header'] , (QVT,HeaderLayout) ->
        headerlayout = new HeaderLayout()
        headerlayout.render()
        QVT.container.show headerlayout

    sendtag:(tagstring) ->
      console.log 'sendtag'
      require ['cs!app/utils/ajax','cs!app/helpers/socket'] , (ajaxutil,sockethelper) ->
        tosend =
          trackingstring: tagstring
        callback = (data) =>
          console.log 'respose came'
          console.log data
        ajaxutil.ajax 'getlivestats',tosend,'POST',callback




  new AppHelper()
