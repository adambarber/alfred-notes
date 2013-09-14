Note = require('../models/note')

handleCreateError = (err) ->
  console.log (err)

exports.index = (req, res) ->
  Note.find (err, notes) ->
    res.send(notes)

exports.show = (req, res) ->
  Note.findOne(id: req.params.id, (error, note) -> res.send(note))

exports.create = (req, res) ->
  note = new Note(content: req.body.content)
  note.save (err) ->
    handleCreateError(err) if err
  res.send(note)