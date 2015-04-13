async = require('async')
config = require('../config')
twit = new twitter(config.twitter)
streamHandler = require('../utils/streamHandler')
sockethelper = require('../core/socket')

class GetLiveStats
  getdata: (incoming,ip,trackingstring,callback) ->

    initsocket = (_callback) ->
      _callback null
      twit.stream 'statuses/filter', { track: trackingstring}, (stream) ->
        stream.on "data",(tweet) ->
          streamHandler.handlestream stream, sockethelper.get(),trackingstring
        stream.on "error",(err)->
          console.log "some error happened in stream parsing --> " + err

    async.waterfall [initsocket],(err,place)->
      callback err
module.exports = new GetLiveStats()
