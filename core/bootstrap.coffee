async = require 'async'
_ = require('underscore')
pjson = require('../package.json')
port = require('../port')
_mongo = require('./mongo')
class SanityCheck

  isEnvironmentSane : (app,callback) ->
    console.log "Initializing Server v#{pjson.version} on #{new Date()}"

    #1. Set up socket.io
    sockets = (_callback) ->
      socket = require './socket'
      io = require('socket.io').listen(app,{log:false})
      socket.setsocket io
      require('../helpers/sockets').initialize(io)
      console.log 'SOCKET.IO [OK]'
      _callback null

    #2. Check MongoDB
    checkmongo = (_callback) ->
      _mongo.getClient (err,db) ->
        if err?
          console.log 'MONGODB [FAIL]'
        else
          console.log 'MONGODB [OK]'
          db.close()
        _callback err

    #3.Reset collection
    resetcollection = (_callback) ->
      _mongo.getClient (err,db) ->
        _callback err
        collection = db.collection config.mongocollection
        collection.drop () ->
          db.close()

    async.waterfall [sockets,checkmongo,resetcollection],(err,res) ->
      if err?
        console.log "Environment is not sane.EXIT."
      else
        console.log "Environment is sane."
      callback err,port

module.exports = new SanityCheck()
