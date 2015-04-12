JSX = require('node-jsx').install()
React = require('react')
TweetsApp = require('./components/TweetsApp.react')
Tweet = require('./models/Tweet')
module.exports =
  index: (req, res) ->
    # Call static model method to get tweets in the db
    Tweet.getTweets 0, 0, (tweets, pages) ->
      # Render React to a string, passing in our fetched tweets
      markup = React.renderComponentToString(TweetsApp(tweets: tweets))
      # Render our 'home' template
      res.render 'home',
        markup: markup
        state: JSON.stringify(tweets)
      return
    return
  page: (req, res) ->
    # Fetch tweets by page via param
    Tweet.getTweets req.params.page, req.params.skip, (tweets) ->
      # Render as JSON
      res.send tweets
      return
    return

