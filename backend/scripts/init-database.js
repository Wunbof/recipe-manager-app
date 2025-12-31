const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');
require('dotenv').config();

async function initializeDatabase() {
  let connection;
  
  try {
    console.log('🔄 Initializing database...');
    console.log(`📡 Connecting to: ${process.env.DB_HOST || 'localhost'}`);
    
    // Create connection without specifying database first (in case it doesn't exist)
    connection = await mysql.createConnection({
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      port: process.env.DB_PORT || 3306,
      ssl: process.env.DB_SSL === 'true' ? { rejectUnauthorized: false } : false
    });
    
    console.log('✅ Connected to MySQL server');
    
    // Check if database exists, create if not
    const [databases] = await connection.query(`SHOW DATABASES LIKE '${process.env.DB_NAME}'`);
    
    if (databases.length === 0) {
      console.log(`📦 Creating database: ${process.env.DB_NAME}`);
      await connection.query(`CREATE DATABASE IF NOT EXISTS \`${process.env.DB_NAME}\``);
      console.log('✅ Database created');
    } else {
      console.log(`✅ Database '${process.env.DB_NAME}' already exists`);
    }
    
    // Close connection and reconnect to the specific database
    await connection.end();
    
    connection = await mysql.createConnection({
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      port: process.env.DB_PORT || 3306,
      multipleStatements: true, // Allow multiple SQL statements
      ssl: process.env.DB_SSL === 'true' ? { rejectUnauthorized: false } : false
    });
    
    console.log(`✅ Connected to database: ${process.env.DB_NAME}`);
    
    // Read schema file
    const schemaPath = path.join(__dirname, '..', '..', 'database', 'schema.sql');
    console.log(`📄 Reading schema from: ${schemaPath}`);
    
    if (!fs.existsSync(schemaPath)) {
      throw new Error(`Schema file not found at: ${schemaPath}`);
    }
    
    const schemaSQL = fs.readFileSync(schemaPath, 'utf8');
    
    // Check if tables already exist
    const [existingTables] = await connection.query('SHOW TABLES');
    const tableNames = existingTables.map(t => Object.values(t)[0]);
    const tablesExist = tableNames.length > 0;
    
    // Split SQL into DDL (table creation) and DML (data insertion) parts
    const sqlParts = schemaSQL.split('-- Sample Data for Testing');
    const ddlSQL = sqlParts[0]; // Everything before sample data
    const dmlSQL = sqlParts[1] || ''; // Sample data (if exists)
    
    if (tablesExist) {
      console.log(`⚠️  Tables already exist: ${tableNames.join(', ')}`);
      console.log('🔄 Recreating tables...');
    }
    
    // Execute DDL (table creation) first
    console.log('🔨 Creating tables...');
    await connection.query(ddlSQL);
    console.log('✅ Tables created successfully!');
    
    // Try to insert sample data (optional, skip if fails)
    if (dmlSQL.trim()) {
      console.log('📝 Inserting sample data...');
      try {
        // Remove the comment line if present
        const insertSQL = dmlSQL.replace(/^--.*$/gm, '').trim();
        if (insertSQL) {
          await connection.query(insertSQL);
          console.log('✅ Sample data inserted');
        }
      } catch (insertError) {
        // Sample data insertion failures are not critical
        if (insertError.code === 'ER_DUP_ENTRY' || insertError.message.includes('Duplicate')) {
          console.log('⚠️  Sample data already exists (skipping)');
        } else {
          console.log(`⚠️  Could not insert sample data: ${insertError.message}`);
          console.log('   (This is okay - you can add data manually later)');
        }
      }
    }
    
    console.log('📊 Database schema initialized successfully!');
    
    // Verify tables were created
    const [tables] = await connection.query('SHOW TABLES');
    console.log(`\n📋 Database tables:`);
    tables.forEach(table => {
      const tableName = Object.values(table)[0];
      console.log(`   - ${tableName}`);
    });
    
    await connection.end();
    console.log('\n🎉 Database deployment completed successfully!');
    process.exit(0);
    
  } catch (error) {
    console.error('\n❌ Database initialization failed:');
    console.error(`   Error: ${error.message}`);
    
    if (error.code === 'ER_ACCESS_DENIED_ERROR') {
      console.error('\n💡 Tip: Check your DB_USER and DB_PASSWORD in .env file');
    } else if (error.code === 'ECONNREFUSED') {
      console.error('\n💡 Tip: Check your DB_HOST and DB_PORT in .env file');
      console.error('   Make sure your MySQL server is running');
    } else if (error.code === 'ENOTFOUND') {
      console.error('\n💡 Tip: Check your DB_HOST in .env file');
    } else if (error.code === 'ER_BAD_DB_ERROR') {
      console.error('\n💡 Tip: The database name might be incorrect');
    }
    
    if (connection) {
      await connection.end();
    }
    process.exit(1);
  }
}

// Check required environment variables (DB_PASSWORD can be empty for local MySQL)
const requiredVars = ['DB_HOST', 'DB_USER', 'DB_NAME'];
const missingVars = requiredVars.filter(varName => !process.env[varName]);

if (missingVars.length > 0) {
  console.error('❌ Missing required environment variables:');
  missingVars.forEach(varName => console.error(`   - ${varName}`));
  console.error('\n💡 Create a .env file in the backend directory with these variables.');
  console.error('   See .env.example for reference.');
  process.exit(1);
}

initializeDatabase();

