async = require 'async'
_socket = require('../core/socket')

class SocketHelper
  initialize: (io) ->
    io.on 'connection',(socket) ->
      socket.on 'joinroom',(data)->
        # error handling TODO
        joinchannel = (_callback)->
          socket.join "tag:#{data.tagstring}"

  checkin: (user,outlet,address) ->
    data =
      username: user.mobile.substr(-4)
      firstname: user.firstname
      middlename: ''
      lastname: user.lastname
      name: user.firstname + ' ' + user.lastname
      userid: user.id
      at: new Date().getTime()
    data.address = address if address?
    io = _socket.get()
    io.sockets.in("outlet:#{outlet.id}").emit "newcheckin",data

module.exports = new SocketHelper()
