Note = require('../models/note')

handleCreateError = (err) ->
  console.log (err)
  res.json 'something went wrong'

exports.index = (req, res) ->
  Note.find (err, notes) ->
    res.json(notes)

exports.show = (req, res) ->
  Note.findOne(_id: req.params.id, (error, note) -> res.json(note))

exports.create = (req, res) ->
  note = new Note(content: req.body.content)
  note.save (err) ->
    handleCreateError(err) if err
  res.json(note)