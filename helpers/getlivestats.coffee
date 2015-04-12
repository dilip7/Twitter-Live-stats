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
        streamHandler.handlestream stream, sockethelper.get(),trackingstring

    async.waterfall [initsocket],(err,place)->
      callback err
module.exports = new GetLiveStats()
