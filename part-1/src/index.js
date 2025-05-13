const express = require('express');
const path = require('path');

const APP_NAME = process.env.APP_NAME || 'default-nodejs-app';
const PORT = process.env.PORT || 3000;

const app = express();

app.use(express.static(path.join(__dirname, '../public')));

app.get('/api/app-info', (req, res) => {
  res.json({
    appName: APP_NAME,
    timestamp: new Date().toISOString()
  });
});

// Simple health check endpoint
app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'healthy',
    appName: APP_NAME,
    timestamp: new Date().toISOString()
  });
});

app.listen(PORT, () => {
  console.log(`[${APP_NAME}] Application started on port ${PORT}`);
});