User  = require('../models/user')

exports.new = (req, res) ->
  res.render "registrations/new", {}

exports.create = (req, res) ->
  User.register new User(username: req.body.username), req.body.password, (err, account) ->
    if err
      return res.render("register", user: user )
    res.redirect "/"