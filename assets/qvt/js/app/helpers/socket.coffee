define ['socketio'],(io) ->
  class SocketHelper

    init: ->
      socket = io.connect("/")
      socket.on "connect",() ->
        console.log "connect happened"
        #socket.emit "joinroom",{"tagstring":'quikwallet'}

      #socket.emit "joinroom",{"tag":'hello'}
      socket.on "livestats", (data) ->
        console.log 'emitted data'
        console.log data
        ###
        require ['cs!app/helpers/billing'],(billinghelper) ->
          billinghelper.newCheckin user
        ###
  new SocketHelper()

