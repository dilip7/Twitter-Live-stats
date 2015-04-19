async = require('async')
config = require('../config')
twit = new twitter(config.twitter)
sockethelper = require('../core/socket')
storetweetshelper = require('../helpers/storetweets')

class GetLiveStats
  getdata: () ->
    trackingstring = "android"
    twit.stream 'statuses/filter', { track: trackingstring}, (stream) ->
      stream.on "data",(tweet) ->
        storetweetshelper.storetweet tweet,trackingstring, (err)->
          console.log err if err?
      stream.on "error",(err)->
        console.log "some error happened in stream parsing --> " + err
        console.log "Twitter returned error for Exceeded connection limit for user"
        console.log "Kindly restart server :("
        process.exit(1)
      stream.on "end",(err) ->
        console.log "Stream end called, rate limit"

module.exports = new GetLiveStats()
