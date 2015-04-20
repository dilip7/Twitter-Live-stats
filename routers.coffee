routes = (app) ->

  app.get '/' , (req,res) ->
    res.render 'qvt'

  app.post '/gettweets' , (req,res) ->
    gettweetshelper = require './helpers/gettweets'
    gettweetshelper.gettweets req.body,(response) ->
      res.header "Access-Control-Allow-Origin", "*"
      res.send response


module.exports = routes
