class Socket
  setsocket: (io) ->
    @io = io
  get: ->
    @io
module.exports = new Socket()
