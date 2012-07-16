http = require('http')
faye = require('faye')
mongoose = require 'mongoose'
User = require "./models/user.coffee"
Message = require "./models/message.coffee"

mongoose.connect "mongodb://localhost/geochat"

bayeux = new faye.NodeAdapter({mount:"/faye"})

bayeux.bind 'publish', (clientId, channel, data) ->
  console.log channel
  switch channel
    when "/messages/new"
      (new Message(data)).save()
      console.log "message.new"
      console.log data

bayeux.bind 'unsubscribe', (clientId, channel) ->
  console.log "#{clientId} unsuscribe from #{channel}"


port = process.env.PORT || 3030

server = http.createServer (req,res) ->
  res.writeHead(200, {'content-type': 'text/plain'})
  res.write('Tune in to ' + port + 'MHz for the best funk around')
  res.end()

console.log("Listening on port " + port)
bayeux.attach(server)

server.listen(port)
