mongoose = require('mongoose')
Schema = mongoose.Schema
noteSchema = new Schema (
  created_at: { type: Date, default: Date.now }
  updated_at: { type: Date, default: Date.now }
  content: String
  category: { type: String, default: 'uncategorized' }
  _user: { type: Schema.Types.ObjectId, ref: 'User' }
)

module.exports = mongoose.model('Note', noteSchema)