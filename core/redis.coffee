class Redis
  @getClient: ->
    redis = require('redis').createClient(6379,'redis',{})
module.exports = Redis
