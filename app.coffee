## App Setup
express       = require("express")
mongoose      = require("mongoose")
app           = express()
serverPort    = process.env.PORT or 3100
mongoDBUrl    = process.env.MONGOHQ_URL or 'mongodb://localhost/alfred_notes_dev'
passport      = require('passport')


## Connect to Mongo
mongoose.connect(mongoDBUrl)

## Configure App
app.configure ->
  app.set('views', __dirname + '/views')
  app.set('view engine', 'jade')
  app.use(express.logger('dev'))
  app.use(express.cookieParser())
  app.use(express.bodyParser())
  app.use(express.methodOverride())
  app.use(express.session({ secret: 'keyboard cat' }))
  app.use(passport.initialize())
  app.use(passport.session())
  app.use(app.router)

## Load Controllers
note         = require('./controllers/notes_controller')
session      = require('./controllers/sessions_controller')
registration = require('./controllers/registrations_controller')

## Load Helpers
checkAuth = require('./helpers/authentication_helper')
require("./helpers/passport_helper")

## Define Routes
app.get '/', (req, res) -> res.render 'index', { user: req.user }
app.get '/login', session.new
app.post '/login', passport.authenticate('local'), session.create
app.get '/logout', session.destroy

app.get '/register', registration.new
app.post '/register', registration.create

app.get '/api/notes', passport.authenticate('bearer', { session: false }), note.index
app.get '/api/notes/today', passport.authenticate('bearer', { session: false }), note.today
app.get '/api/notes/:id', passport.authenticate('bearer', { session: false }), note.show
app.post '/api/notes', passport.authenticate('bearer', { session: false }), note.create

## Start Server
app.listen serverPort, ->
  console.log "Server listening on port #{serverPort}..."


