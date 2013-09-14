## Setup Express server
express  = require("express")
mongoose = require("mongoose")
app      = express()
serverPort = process.env.PORT or 3100
mongoDBUrl = process.env.MONGOHQ_URL or 'mongodb://localhost/alfred_notes_dev'

## Connect to Mongo
mongoose.connect(mongoDBUrl)

## Configure App
app.configure ->
  app.set('views', __dirname + '/views')
  app.set('view engine', 'jade')
  app.use(express.logger('dev'))
  app.use(express.bodyParser())

## Load routes
note = require('./controllers/notes_controller')

app.get '/', (req, res) -> res.render 'index'

app.get '/notes',     note.index
app.get '/notes/today', note.today
app.get '/notes/:id', note.show
app.post '/notes',    note.create

app.listen serverPort
console.log "Server listening on port #{serverPort}..."