# Load Modules
Note = require('./models/note')

exports.post = (req, res) ->
  new Note(content: req.body.content).save()

exports.list = (req, res) ->
  Note.find( (err, notes) ->
    res.send(notes)
  )