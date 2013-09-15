mongoose = require('mongoose')
Schema = mongoose.Schema
noteSchema = new Schema (
  created_at: { type: Date, default: Date.now }
  updated_at: { type: Date, default: Date.now }
  content: String
  _user: { type: Schema.Types.ObjectId, ref: 'User' }
)

module.exports = mongoose.model('Note', noteSchema)