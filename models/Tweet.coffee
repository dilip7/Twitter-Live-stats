mongoose = require('mongoose')
# Create a new schema for our tweet data
schema = new (mongoose.Schema)(
  twid: String
  active: Boolean
  author: String
  avatar: String
  body: String
  date: Date
  screenname: String
  domains: Array)
# Create a static getTweets method to return tweet data from the db

schema.statics.getTweets = (page, skip, callback) ->
  tweets = []
  start = page * 10 + skip * 1
  # Query the db, using skip and limit to achieve page chunks
  Tweet.find({}, 'twid active author avatar body date screenname',
    skip: start
    limit: 10).sort(date: 'desc').exec (err, docs) ->
    # If everything is cool...
    if !err
      console.log docs
      tweets = docs
      # We got tweets
      tweets.forEach (tweet) ->
        tweet.active = true
        # Set them to active
        return
    # Pass them back to the specified callback
    callback tweets
    return
  return

# Return a Tweet model based upon the defined schema
module.exports = Tweet = mongoose.model('Tweet', schema)
