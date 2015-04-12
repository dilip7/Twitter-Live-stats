Tweet = require('../models/Tweet')

module.exports = (stream, io) ->
  # When tweets get sent our way ...
  stream.on 'data', (data) ->
    console.log "stream data"
    console.log data
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
    tweetEntry.save (err) ->
      if !err
        # If everything is cool, socket.io emits the tweet.
        io.emit 'tweet', tweet
      return
    return
  return

