const { HOST, PORT, MONGO_URL } = require('../conf');
const { connectDB } = require('../utils/db');
const express = require('express');
const app = express();
const { User } = require('./models/user');

app.get('/test', async (req, res) => {
  res.send('Server is working correctly');
})

app.get('/users', async (req, res) => {
  const user = new User({ userName: 'NewUser' + Math.random() * 100});
  await user.save()
  const users = await User.find();
  res.json(users);
});

connectDB(MONGO_URL).then(() => {
  app.listen(PORT, () => {
    console.log('API-service is working')
  })
}).catch(e => {
  console.log('COULD not connect to Mongodb, aborting!');
})
