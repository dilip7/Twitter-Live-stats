Tweet = require('../models/Tweet')
_ = require('underscore')
async = require('async')
_mongo = require('../core/mongo')
request = require ("request")
nodeurl = require('url')
_socket = require('../core/socket')
config = require('../config')
sockethelper = require('./sockets')

exapndurlendpoint  = "http://api.longurl.org/v2/expand?url="

class StoreTweets
  storetweet : (incomingtweet,tagsstring,callback) ->
    # When tweets get sent our way ...
    storetweet1 = (_callback) ->
      # Construct a new tweet object
      tweet =
        twid: incomingtweet['id']
        active: false
        author: incomingtweet['user']['name']
        avatar: incomingtweet['user']['profile_image_url']
        body: incomingtweet['text']
        date: incomingtweet['created_at']
        screenname: incomingtweet['user']['screen_name']
        urls : incomingtweet['entities']['urls']
        tag : tagsstring
      console.log "STARTING " + incomingtweet.id
      _callback null,tweet

    expandurls = (details,_callback) ->
      # some urls were found
      embeddedurls = incomingtweet.entities?.urls
      if embeddedurls and embeddedurls.length isnt 0
        async.each embeddedurls , ((eachurlobject ,__callback)=>
          dest = exapndurlendpoint + encodeURIComponent(eachurlobject.expanded_url) + "&format=json"
          request.get dest , (error, response, body) ->
            if !error and response.statusCode == 200
              # for now focussing only on 3 charachter domains like com org etc , co.in wasgetting complicated but can be done
              # also keeping hostname like play.google.com for now , wasted lot of timeto make it perfect like google.com but no success :(
              expansion =  JSON.parse(body)
              resultedurl =  expansion['long-url']
              details.domain = nodeurl.parse(resultedurl).hostname
            else
              details.domain = nodeurl.parse(eachurlobject.expanded_url).hostname
            __callback error
          ),(err)->
            _callback err,details
      else
        # no need to process this tweet
        _callback "notvalid"

    storetweet2 = (details,_callback) ->
      _mongo.getClient (err,db) ->
        collection = db.collection config.mongocollection
        collection.insert details,{w:1},(err,res)->
          console.log "STORING " + incomingtweet.id
          db.close()
          _callback err,details

    fetchlivestats = (details,_callback) ->
      _mongo.getClient (err,db) ->
        collection = db.collection config.mongocollection
        collection.aggregate {$match: {tag: tagsstring}},{$group: {_id: "$domain",total: {$sum: 1}}},{$sort: {total: -1}} , (err,res) ->
          db.close()
          _callback err,res

    emitsocket = (stats,_callback) ->
      sockethelper.sendstats stats,tagsstring
      _callback null

    async.waterfall [storetweet1,expandurls,storetweet2,fetchlivestats,emitsocket],(err,place)->
      console.log "PROCESSED " + incomingtweet.id
      if err?
        console.log err
        if err is "notvalid"
          callback null if callback?
        else
          callback err if callback?
      else
        callback null if callback?

module.exports = new StoreTweets()
