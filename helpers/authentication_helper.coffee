module.exports.localAuth = (req, res, next) ->
  return next()  if req.isAuthenticated()
  res.redirect "/login"