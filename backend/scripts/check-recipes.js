require('dotenv').config();
const { pool } = require('../config/database');

async function checkRecipes() {
  try {
    const [recipes] = await pool.query('SELECT recipe_id, title, user_id FROM recipes');
    console.log(`\n📊 Recipes in database: ${recipes.length}\n`);
    
    if (recipes.length === 0) {
      console.log('  (No recipes found in database)');
    } else {
      recipes.forEach(r => {
        console.log(`  - ${r.title} (ID: ${r.recipe_id}, User: ${r.user_id})`);
      });
    }
    console.log('');
    
    await pool.end();
    process.exit(0);
  } catch (error) {
    console.error('Error:', error.message);
    await pool.end();
    process.exit(1);
  }
}

checkRecipes();

