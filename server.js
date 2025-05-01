require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const app = express();

// اتصال به MongoDB
mongoose.connect(process.env.MONGODB_URI || 'mongodb://localhost:27017/websv', {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

// مدل کاربر
const User = mongoose.model('User', {
  username: String,
  password: String
});

// API Routes
app.get('/api/users', async (req, res) => {
  const users = await User.find();
  res.json(users);
});

// اجرای سرور
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
