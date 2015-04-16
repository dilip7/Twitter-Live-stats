async = require 'async'
_socket = require('../core/socket')

class SocketHelper
  initialize: (io) ->
    io.on 'connection',(socket) ->
      socket.on 'joinroom',(data)->
        console.log "joinroom called"
        console.log data
        # check if already member of a room , then remove him
        if socket.room?
          socket.leave socket.room
        # assign to new room
        socket.room = "room:#{data.tagstring}"
        socket.join socket.room

      socket.on 'disconnect',() ->
        socket.leave socket.room

  sendstats: (data,tagstring) ->
    io = _socket.get()
    #io.sockets.in("room:#{tagstring}").emit "livestats",data
    io.sockets.emit "livestats",data

module.exports = new SocketHelper()
