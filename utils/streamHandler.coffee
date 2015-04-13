Tweet = require('../models/Tweet')
_ = require('underscore')
async = require('async')
storetweetshelper = require('../helpers/storetweets')


class StreamHandler
  handlestream : (stream,io,trackingstring) ->
    # When tweets get sent our way ...
    stream.on 'data', (data) ->
      preprocess = (_callback ) ->
        if data?
          _callback null
        else
          _callback "error in tweet"

      storetweets = (_callback) ->
        # Construct a new tweet object
        tweet =
          twid: data['id']
          active: false
          author: data['user']['name']
          avatar: data['user']['profile_image_url']
          body: data['text']
          date: data['created_at']
          screenname: data['user']['screen_name']
        # Create a new model instance with our object
        tweetEntry = new Tweet(tweet)
        # Save 'er to the database
        storetweetshelper.storetweet data,trackingstring
        tweetEntry.save (err) ->
          if !err
            # If everything is cool, socket.io emits the tweet.
            io.emit 'tweet', tweet
      async.waterfall [preprocess,storetweets],(err,place)->
        callback err

module.exports = new StreamHandler()
