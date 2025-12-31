require('dotenv').config();
const bcrypt = require('bcryptjs');
const { pool } = require('../config/database');

async function fixDemoUser() {
  try {
    // Delete existing demo user
    await pool.query('DELETE FROM users WHERE email = ?', ['demo@example.com']);
    console.log('🗑️  Removed old demo user');
    
    // Create new demo user with proper password hash
    const password = 'demo123';
    const hashedPassword = await bcrypt.hash(password, 10);
    
    await pool.query(
      'INSERT INTO users (username, email, password_hash) VALUES (?, ?, ?)',
      ['demo_user', 'demo@example.com', hashedPassword]
    );
    
    console.log('✅ Demo user created with valid password!');
    console.log('   Email: demo@example.com');
    console.log('   Password: demo123\n');
    
    await pool.end();
    process.exit(0);
  } catch (error) {
    console.error('Error:', error.message);
    await pool.end();
    process.exit(1);
  }
}

fixDemoUser();

