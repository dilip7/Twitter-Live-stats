# refis class used only for sessions, though sessions are not needed I have still kept
class Redis
  @getClient: ->
    redis = require('redis').createClient()
module.exports = Redis
