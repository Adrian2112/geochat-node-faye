mongoose = require('mongoose')

Schema = mongoose.Schema
ObjectId = Schema.ObjectId

messageSchema = new Schema({
    created_at: {type: Date, default: Date.now}
    updated_at: {type: Date, default: Date.now}
    user_id: {type: ObjectId}
    text: String
    place_id: String
})

module.exports = mongoose.model('Message', messageSchema)
