User = require('../models/user')

exports.login = (req, res) ->
  res.render('sessions/login')