define ['socketio'],(io) ->
  class SocketHelper
    sockethandler = null

    init: ->
      socket = io.connect("/")
      socket.on "connect",() ->
        console.log "connect happened"

      socket.on "livestats", (data) ->
        console.log 'emitted data'
        console.log data
      ###
        sockethandler = socket
        console.log "connect happened"

      socket.on "livestats", (data) ->
        console.log 'emitted data'
        console.log data
        require ['cs!app/helpers/billing'],(billinghelper) ->
          billinghelper.newCheckin user

    emit:(tagstring) ->
      console.log "emit"
      if sockethandler?
        sockethandler.emit "joinroom" ,{"tagstring":tagstring}
     ###

  new SocketHelper()

