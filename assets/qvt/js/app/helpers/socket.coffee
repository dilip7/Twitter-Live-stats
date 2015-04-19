define ['socketio'],(io) ->
  class SocketHelper
    sockethandler = null

    init: ->
      socket = io.connect("/")
      socket.on "connect",() ->
        console.log "connect happened"

      socket.on "livestats", (data) ->
        require ['cs!app/helpers/app'],(apphelper) ->
          apphelper.renderstats data

  new SocketHelper()

