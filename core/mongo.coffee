config = require '../config'
MongoClient = require('mongodb').MongoClient

# centralized class for getting mongo clients
class Mongo
  getClient:(callback) ->
    MongoClient.connect config.mongourl,callback
module.exports = new Mongo()
