require('dotenv').config();
const { pool } = require('../config/database');

async function checkAll() {
  try {
    console.log('\n📊 Database Summary:\n');
    
    // Check users
    const [users] = await pool.query('SELECT user_id, username, email, created_at FROM users ORDER BY created_at DESC');
    console.log(`👤 Users: ${users.length}`);
    users.forEach(u => {
      console.log(`   - ${u.username} (${u.email}) - Created: ${u.created_at}`);
    });
    
    console.log('');
    
    // Check recipes
    const [recipes] = await pool.query('SELECT recipe_id, title, user_id, category, created_at FROM recipes ORDER BY created_at DESC');
    console.log(`🍳 Recipes: ${recipes.length}`);
    recipes.forEach(r => {
      console.log(`   - "${r.title}" (Category: ${r.category || 'N/A'}, User ID: ${r.user_id}) - Created: ${r.created_at}`);
    });
    
    console.log('');
    console.log('✅ Everything is saved in your database!');
    console.log('');
    
    await pool.end();
    process.exit(0);
  } catch (error) {
    console.error('Error:', error.message);
    await pool.end();
    process.exit(1);
  }
}

checkAll();

