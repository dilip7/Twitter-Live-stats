config = require '../config'
MongoClient = require('mongodb').MongoClient
class Mongo
  getClient:(callback) ->
    MongoClient.connect config.mongourl,callback
module.exports = new Mongo()
