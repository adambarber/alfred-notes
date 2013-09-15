Note = require('../models/note')
User = require('../models/user')

handleCreateError = (err) ->
  console.log (err)
  res.json 'something went wrong'

exports.index = (req, res) ->
  Note.find(_user: req.user._id).exec (err, notes) ->
      notes = notes
      res.json(notes)

exports.today = (req, res) ->
  today = new Date()
  Note.find
    _user: req.user._id
    created_at:
      $gte: today.setHours(0,0,0,0)
  , (err, notes) ->
    res.json notes

exports.show = (req, res) ->
  Note.findOne( _user: req.user._id, _id: req.params.id
  , (error, note) -> res.json(note))

exports.create = (req, res) ->
  note = new Note
    content: req.body.content
    _user: req.user._id
  console.log note
  note.save (err) ->
    handleCreateError(err) if err
    res.json note

