User  = require('../models/user')

exports.new = (req, res) ->
  res.render "registrations/new", {}

exports.create = (req, res) ->
  username = req.body.username
  email = req.body.email
  password = req.body.password
  User.register new User(username: username, email: email), password, (err, user) ->
    return res.render("registrations/new", user: user ) if err
    res.redirect "/"