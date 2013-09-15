mongoose = require('mongoose')
Schema = mongoose.Schema
passportLocalMongoose = require('passport-local-mongoose')
uuid = require('node-uuid')

## User Schema
userSchema = new Schema
  email:
    type: String
    unique: true
  token:
    type: String
    default: uuid.v1
    unique: true
  _notes: [{ type: Schema.Types.ObjectId, ref: 'Note' }]

userSchema.plugin(passportLocalMongoose)
module.exports = mongoose.model('User', userSchema)
