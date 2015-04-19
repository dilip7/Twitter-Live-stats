_ = require('underscore')
async = require('async')
_mongo = require('../core/mongo')
config = require('../config')
sockethelper = require('./sockets')

exapndurlendpoint  = "http://api.longurl.org/v2/expand?url="

class GetTweets
  gettweets : (incoming,callback) ->

    gettweets = (_callback) ->
      console.log 'here'
      _mongo.getClient (err,db) ->
        collection = db.collection config.mongocollection
        #collection.find {"domain":"#{incoming.domain}"}.sort({"timestamp_ms":-1}).toArray() ,{w:1},(err,res)->
        collection.find({"domain":"#{incoming.domain}"}).sort({"timestamp_ms":-1}).toArray (err,res)->
          console.log err
          db.close()
          _callback err,res

    async.waterfall [gettweets],(err,data)->
      console.log data.length
      if err?
        callback JSON.stringify {"status":"failed"}
      else
        callback JSON.stringify {"status":"success","tweets":data}

module.exports = new GetTweets()
