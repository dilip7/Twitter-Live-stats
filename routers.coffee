routes = (app) ->

  app.get '/:tag' , (req,res) ->
    res.send "Shit works!"
    livestatshelper = require './helpers/getlivestats'
    livestatshelper.getdata req.body,req.ip,req.params.tag,(response) ->
      #res.header "Access-Control-Allow-Origin", "*"
      #res.send response

module.exports = routes
