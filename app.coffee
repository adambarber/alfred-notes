## App Setup
express       = require("express")
mongoose      = require("mongoose")
app           = express()
serverPort    = process.env.PORT or 3100
mongoDBUrl    = process.env.MONGOHQ_URL or 'mongodb://localhost/alfred_notes_dev'
passport      = require('passport')
LocalStrategy = require('passport-local').Strategy
User          = require('./models/user')

passport.use(User.createStrategy())
passport.serializeUser(User.serializeUser())
passport.deserializeUser(User.deserializeUser())

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
note    = require('./controllers/notes_controller')
session = require('./controllers/sessions_controller')
registration = require('./controllers/registrations_controller')

## Load Helpers
checkAuth = require('./helpers/authentication_helper')

## Define Routes
app.get '/', (req, res) -> res.render 'index'

app.get '/login', session.new
app.post '/login', passport.authenticate('local'), session.create

app.get '/register', registration.new
app.post '/register', registration.create

app.get '/notes', checkAuth, note.index
app.get '/notes/today', checkAuth, note.today
app.get '/notes/:id', checkAuth, note.show
app.post '/notes', checkAuth, note.create

## Start Server
app.listen serverPort, ->
  console.log "Server listening on port #{serverPort}..."


