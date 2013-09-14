mongoose = require('mongoose')
passport = require('passport')
bcrypt = require('bcrypt')
SALT_WORK_FACTOR = 10

LocalStrategy = require('passport-local').Strategy
Schema = mongoose.Schema

## User Schema
userSchema = new Schema (
  email: { type: String, required: true, unique: true }
  password: { type: String, required: true }
)

## Encrypt Password
userSchema.pre 'save', (next) ->

## Verify Password
userSchema.methods.comparePassword = (password, callback) ->
  bcrypt.compare password, this.password, (err, isMatch) ->
    return callback(err) if err
    callbacl(null, isMatch)


module.exports = mongoose.model('User', userSchema)