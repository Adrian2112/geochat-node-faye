mongoose = require('mongoose')

Schema = mongoose.Schema
ObjectId = Schema.ObjectId

userSchema = new Schema({
  created_at: {type: Date, default: Date.now}
  name: String
  gender: String
  photo: String
  foursquare_id: Number
  email: String
  token: String
})

module.exports = mongoose.model('User',userSchema)
