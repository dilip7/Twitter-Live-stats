async = require('async')
config = require('../config')
twit = new twitter(config.twitter)
streamHandler = require('../utils/streamHandler')
sockethelper = require('../core/socket')
storetweetshelper = require('../helpers/storetweets')

class GetLiveStats
  getdata: (incoming,ip,trackingstring,callback) ->

    initsocket = (_callback) ->
      _callback null
      twit.stream 'statuses/filter', { track: trackingstring}, (stream) ->
        stream.on "data",(tweet) ->
          console.log tweet.id
          #streamHandler.handlestream stream, sockethelper.get(),trackingstring
          storetweetshelper.storetweet tweet,trackingstring, (err)->
            console.log err if err?
        stream.on "error",(err)->
          console.log "some error happened in stream parsing --> " + err

    async.waterfall [initsocket],(err,place)->
      callback err
module.exports = new GetLiveStats()
