LocalStrategy  = require('passport-local').Strategy
BearerStrategy = require('passport-http-bearer').Strategy
User           = require('../models/user')
passport       = require('passport')

passport.serializeUser(User.serializeUser())
passport.deserializeUser(User.deserializeUser())
passport.use(User.createStrategy())

passport.use new BearerStrategy (token, done) ->
  User.findOne 'token': "#{token}", (err, user) ->
    return done(err)  if err
    return done(null, false) unless user
    done null, user, scope: "all"
