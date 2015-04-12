async = require 'async'
_ = require('underscore')
pjson = require('../package.json')
port = require('../port')
class SanityCheck

  isEnvironmentSane : (app,callback) ->
    console.log "Initializing Server v#{pjson.version} on #{new Date()}"

    # Set up socket.io
    sockets = (_callback) ->
      socket = require './socket'
      io = require('socket.io').listen(app,{log:false})
      socket.setsocket io
      #require('../helpers/sockets').initialize(io)
      _callback null

    async.waterfall [sockets],(err,res) ->
      if err?
        console.log "Environment is not sane.EXIT."
      else
        console.log "Environment is sane."
      callback err,port

module.exports = new SanityCheck()
