mongoose = require('mongoose')
Schema = mongoose.Schema
passport = require('passport')
LocalStrategy = require('passport-local').Strategy
passportLocalMongoose = require('passport-local-mongoose')

## User Schema
userSchema = new Schema
userSchema.plugin(passportLocalMongoose)

module.exports = mongoose.model('User', userSchema)
