const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
require('dotenv').config();

const { testConnection } = require('./config/database');
const authRoutes = require('./routes/auth');
const recipeRoutes = require('./routes/recipes');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Request logging middleware
app.use((req, res, next) => {
  console.log(`${new Date().toISOString()} - ${req.method} ${req.path}`);
  next();
});

// Routes
app.get('/', (req, res) => {
  res.json({
    success: true,
    message: 'Recipe Manager API is running',
    version: '1.0.0',
    endpoints: {
      auth: {
        register: 'POST /api/auth/register',
        login: 'POST /api/auth/login'
      },
      recipes: {
        getAll: 'GET /api/recipes',
        getOne: 'GET /api/recipes/:id',
        create: 'POST /api/recipes',
        update: 'PUT /api/recipes/:id',
        delete: 'DELETE /api/recipes/:id',
        toggleFavorite: 'PATCH /api/recipes/:id/favorite',
        getFavorites: 'GET /api/recipes/favorites/list'
      }
    }
  });
});

app.use('/api/auth', authRoutes);
app.use('/api/recipes', recipeRoutes);

// 404 handler
app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: 'Route not found'
  });
});

// Error handler
app.use((err, req, res, next) => {
  console.error('Error:', err);
  res.status(500).json({
    success: false,
    message: 'Internal server error',
    error: process.env.NODE_ENV === 'development' ? err.message : undefined
  });
});

// Start server
function startServer() {
  // Start server immediately (don't wait for DB connection)
  app.listen(PORT, '0.0.0.0', () => {
    console.log(`🚀 Server is running on port ${PORT}`);
    console.log(`📝 API Documentation: http://localhost:${PORT}/`);
    console.log('🔄 Testing database connection...');
  });

  // Test database connection in the background (non-blocking)
  testConnection().then(() => {
    console.log('✅ Database ready');
  }).catch((error) => {
    console.error('⚠️  Database connection issue:', error.message);
    console.error('   Server is running, but database operations may fail');
    console.error('   Check your database configuration in .env file');
  });
}

startServer();
