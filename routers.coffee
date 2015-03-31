config = require 'config'
routes = (app) ->

  app.get '/' , (req,res) ->
    res.render "#{__dirname}/views/qw",
      token : req.csrfToken()
      recaptcha_key : "#{config.recaptcha.public_key}"

module.exports = routes
