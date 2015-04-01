routes = (app) ->

  app.get '/' , (req,res) ->
    res.send "Shit works!"

module.exports = routes
