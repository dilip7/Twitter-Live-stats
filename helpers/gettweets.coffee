_ = require('underscore')
async = require('async')
_mongo = require('../core/mongo')
config = require('../config')
sockethelper = require('./sockets')

exapndurlendpoint  = "http://api.longurl.org/v2/expand?url="

class GetTweets
  gettweets : (incoming,callback) ->

    gettweets = (_callback) ->
      _mongo.getClient (err,db) ->
        collection = db.collection config.mongocollection
        #collection.find {"domain":"#{incoming.domain}"}.sort({"timestamp_ms":-1}).toArray() ,{w:1},(err,res)->
        collection.find({"domain":"#{incoming.domain}"}).sort({"timestamp_ms":-1}).toArray (err,res)->
          db.close()
          _callback err,res

    async.waterfall [gettweets],(err,data)->
      if err?
        callback JSON.stringify {"status":"failed"}
      else
        callback JSON.stringify {"status":"success","tweets":data}

module.exports = new GetTweets()
