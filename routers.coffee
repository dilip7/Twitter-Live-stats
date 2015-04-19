routes = (app) ->

  app.get '/' , (req,res) ->
    #res.send "Shit works!"
    res.render 'qvt'

  ###
  talked to sai , this is not needed anymore :)
  app.post '/getlivestats' , (req,res) ->
    livestatshelper = require './helpers/getlivestats'
    livestatshelper.getdata req.body,req.ip,(response) ->
      res.header "Access-Control-Allow-Origin", "*"
      res.send response
  ###

  app.post '/gettweets' , (req,res) ->
    console.log req.body
    gettweetshelper = require './helpers/gettweets'
    gettweetshelper.gettweets req.body,(response) ->
      res.header "Access-Control-Allow-Origin", "*"
      res.send response


module.exports = routes
