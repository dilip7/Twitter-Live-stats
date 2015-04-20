async = require 'async'
_socket = require('../core/socket')

class SocketHelper
  initialize: (io) ->
    io.on 'connection',(socket) ->

  sendstats: (data,tagstring) ->
    io = _socket.get()
    io.sockets.emit "livestats",data

module.exports = new SocketHelper()
