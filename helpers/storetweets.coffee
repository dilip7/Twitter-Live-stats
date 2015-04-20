_ = require('underscore')
async = require('async')
_mongo = require('../core/mongo')
request = require ("request")
nodeurl = require('url')
_socket = require('../core/socket')
config = require('../config')
sockethelper = require('./sockets')

# endpoint to get expanded urls , while I was developing it worked nicely , for demo purpose this will do
exapndurlendpoint  = "http://api.longurl.org/v2/expand?url="

#this is the class that does most of processing
# 1. first expand all urls
# 2. store each tweet
# 3. fetch fresh domain stats
# 4. emit this stats to all sockets
class StoreTweets
  storetweet : (incomingtweet,tagsstring,callback) ->

    # this function expands url , if it fails then it stores twitter specified twitter specified expanded_url
    expandurls = (_callback) ->
      # store tag for mongo queries
      incomingtweet.tag = tagsstring
      # some urls were found
      embeddedurls = incomingtweet.entities?.urls
      if embeddedurls and embeddedurls.length isnt 0
        # using async.each which does parallel processing
        # but blocks till all urls are processed
        async.each embeddedurls , ((eachurlobject ,__callback)=>
          dest = exapndurlendpoint + encodeURIComponent(eachurlobject.expanded_url) + "&format=json"
          # sending request
          request.get dest , (error, response, body) ->
            if !error and response.statusCode == 200
              # for now focussing only on 3 charachter domains like com org etc , co.in was getting complicated but can be done
              # also keeping hostname like play.google.com for now , wasted lot of timeto make it perfect like google.com but no success :(
              expansion =  JSON.parse(body)
              resultedurl =  expansion['long-url']
              incomingtweet.domain = nodeurl.parse(resultedurl).hostname
            else
              # just put what twitter expanded url is in case api returned errors
              incomingtweet.domain = nodeurl.parse(eachurlobject.expanded_url).hostname
            __callback error
          ),(err)->
            _callback err
      else
        # no need to process this tweet , as no url was embedded in it
        _callback "notvalid"

    # store in mongo collection
    storetweet = (_callback) ->
      _mongo.getClient (err,db) ->
        collection = db.collection config.mongocollection
        collection.insert incomingtweet,{w:1},(err,res)->
          db.close()
          _callback err

    # query mongo to get realtime stats
    getdomaincount = (_callback) ->
      _mongo.getClient (err,db) ->
        collection = db.collection config.mongocollection
        collection.aggregate {$match: {tag: tagsstring}},{$group: {_id: "$domain",total: {$sum: 1}}},{$sort: {total: -1}},{$project:{domain:"$_id",total:"$total",_id:0}} , (err,res) ->
          db.close()
          _callback err,res


    # now emit this stats , havenot added any empty stats check etc as mostly we will find some tweets
    emitsocket = (stats,_callback) ->
      # top 10 for demo purpose
      stats = stats.slice(0,10)
      sockethelper.sendstats stats,tagsstring
      _callback null

    async.waterfall [expandurls,storetweet,getdomaincount,emitsocket],(err,place)->
      if err?
        if err is "notvalid"
          callback null if callback?
        else
          callback err if callback?
      else
        callback null if callback?

module.exports = new StoreTweets()
