mongoose = require('mongoose')
Schema = mongoose.Schema
noteSchema = new Schema (
  created_at: { type: Date, default: Date.now }
  updated_id: { type: Date, default: Date.now }
  content: String
)

module.exports = mongoose.model('Note', noteSchema)