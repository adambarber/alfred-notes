exports.new = (req, res) ->
  res.render('sessions/login', { user: req.user, message: req.session.messages })

exports.create = (req, res) ->
  res.redirect('/')

exports.destroy = (req, res) ->
  req.logout()
  res.redirect('/')