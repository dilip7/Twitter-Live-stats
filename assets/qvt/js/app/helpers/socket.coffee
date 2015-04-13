define ['socketio'],(io) ->
  class SocketHelper

    init: ->
      socket = io.connect("/")
      socket.on "connect",() -> socket.emit "joinroom",{"tag":'hello'}
      ###
      socket.on "newcheckin", (user) ->
        require ['cs!app/helpers/billing'],(billinghelper) ->
          billinghelper.newCheckin user
      ###
  new SocketHelper()

