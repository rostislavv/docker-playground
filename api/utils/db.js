const mongoose = require('mongoose');

module.exports = {
  connectDB: function (url) {
    return mongoose.connect(url);
  }
}
