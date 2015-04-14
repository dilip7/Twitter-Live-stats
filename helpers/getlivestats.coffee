async = require('async')
config = require('../config')
twit = new twitter(config.twitter)
streamHandler = require('../utils/streamHandler')
sockethelper = require('../core/socket')
storetweetshelper = require('../helpers/storetweets')

class GetLiveStats
  getdata: (incoming,ip,callback) ->

    initsocket = (_callback) ->
      _callback null
      twit.stream 'statuses/filter', { track: incoming.trackingstring}, (stream) ->
        stream.on "data",(tweet) ->
          #streamHandler.handlestream stream, sockethelper.get(),trackingstring
          storetweetshelper.storetweet tweet,incoming.trackingstring, (err)->
            console.log err if err?
        stream.on "error",(err)->
          console.log "some error happened in stream parsing --> " + err
          console.log "Twitter returned error for Exceeded connection limit for user"
          console.log "Kindly restart server :("
          process.exit(1)

    async.waterfall [initsocket],(err,place)->
      callback {status:"success"}

module.exports = new GetLiveStats()
