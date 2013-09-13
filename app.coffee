express = require("express")
app = express()
serverPort = process.env.PORT or 3100
app.get "/", (request, response) ->
  response.type "text/plain"
  response.send "test test test"

app.listen serverPort
console.log "Server listening on port #{serverPort}..."