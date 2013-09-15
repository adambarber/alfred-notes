Note = require('../models/note')

handleCreateError = (err) ->
  res.json 'something went wrong'

exports.index = (req, res) ->
  Note.find(_user: req.user._id).exec (err, notes) ->
    handleCreateError(err) if err
    notes = notes
    res.json(notes)

exports.today = (req, res) ->
  today = new Date()
  Note.find
    _user: req.user._id
    created_at:
      $gte: today.setHours(0,0,0,0)
  , (err, notes) ->
    handleCreateError(err) if err
    res.json notes

exports.show = (req, res) ->
  Note.findOne( _user: req.user._id, _id: req.params.id
  , (err, note) ->
    handleCreateError(err) if err
    res.json(note)
  )

exports.create = (req, res) ->
  note = new Note
    category: req.body.category
    content: req.body.content
    _user: req.user._id
  console.log note
  note.save (err) ->
    handleCreateError(err) if err
    res.json note

