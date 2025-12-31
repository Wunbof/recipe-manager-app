require('dotenv').config();
const { pool } = require('../config/database');

async function checkUsers() {
  try {
    const [users] = await pool.query('SELECT user_id, username, email FROM users');
    console.log(`\n📊 Users in database: ${users.length}\n`);
    
    if (users.length === 0) {
      console.log('⚠️  No users found!');
      console.log('   You need to register a new user first.\n');
    } else {
      users.forEach(u => {
        console.log(`   - ${u.username} (${u.email})`);
      });
      console.log('');
    }
    
    await pool.end();
    process.exit(0);
  } catch (error) {
    console.error('Error:', error.message);
    await pool.end();
    process.exit(1);
  }
}

checkUsers();

