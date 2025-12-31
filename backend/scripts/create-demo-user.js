require('dotenv').config();
const bcrypt = require('bcryptjs');
const { pool } = require('../config/database');

async function createDemoUser() {
  try {
    // Check if demo user exists
    const [existing] = await pool.query(
      'SELECT * FROM users WHERE email = ?',
      ['demo@example.com']
    );
    
    if (existing.length > 0) {
      console.log('✅ Demo user already exists!');
      await pool.end();
      process.exit(0);
    }
    
    // Create demo user
    const password = 'demo123';
    const hashedPassword = await bcrypt.hash(password, 10);
    
    await pool.query(
      'INSERT INTO users (username, email, password_hash) VALUES (?, ?, ?)',
      ['demo_user', 'demo@example.com', hashedPassword]
    );
    
    console.log('✅ Demo user created successfully!');
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

createDemoUser();

