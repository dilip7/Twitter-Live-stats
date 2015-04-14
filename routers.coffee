routes = (app) ->

  app.get '/' , (req,res) ->
    #res.send "Shit works!"
    res.render 'qvt'

  app.post '/getlivestats' , (req,res) ->
    livestatshelper = require './helpers/getlivestats'
    livestatshelper.getdata req.body,req.ip,(response) ->
      res.header "Access-Control-Allow-Origin", "*"
      res.send response



module.exports = routes
