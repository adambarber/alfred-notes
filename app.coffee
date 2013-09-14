## Setup Express server
express  = require("express")
mongoose = require("mongoose")
app      = express()
serverPort = process.env.PORT or 3100

## Connect to Mongo
mongoose.connect('mongodb://localhost/alfred_notes_dev')

## Configure App
app.configure ->
  app.set('views', __dirname + '/views')
  app.set('view engine', 'jade')
  app.use(express.logger('dev'))
  app.use(express.bodyParser())

## load models
Note = require('./models/note')

## Load routes
note = require('./routes/notes')

app.get '/', (req, res) -> res.render 'index'

app.get '/notes',     note.index
app.get '/notes/:id', note.show
app.post '/notes',    note.create

app.listen serverPort
console.log "Server listening on port #{serverPort}..."