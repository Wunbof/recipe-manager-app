-- Recipe Manager Database Schema
-- Database: recipe_manager

-- Drop tables if they exist (for fresh setup)
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS users;

-- Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Recipes Table
CREATE TABLE recipes (
    recipe_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    ingredients TEXT NOT NULL,
    instructions TEXT NOT NULL,
    cooking_time INT,
    category VARCHAR(50),
    image_url VARCHAR(255),
    is_favorite BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Create indexes for better performance
CREATE INDEX idx_user_id ON recipes(user_id);
CREATE INDEX idx_category ON recipes(category);
CREATE INDEX idx_is_favorite ON recipes(is_favorite);

-- Sample Data for Testing
INSERT INTO users (username, email, password_hash) VALUES
('demo_user', 'demo@example.com', '$2a$10$rKvVLhHhHhHhHhHhHhHhHuX8pMVwZ8ZYqJ0qJ0qJ0qJ0qJ0qJ0qJ0q');
('wunbof', 'wunbof@gmail.com', '$2a$10$rKvVLhHhHhHhHhHhHhHhHuX8pMVwZ8ZYqJ0qJ0qJ0qJ0qJ0qJ0qJ0q');
-- Password is 'demo123' (you should hash this properly in production)

INSERT INTO recipes (user_id, title, description, ingredients, instructions, cooking_time, category, image_url, is_favorite) VALUES
(1, 'Classic Pancakes', 'Fluffy and delicious breakfast pancakes', '1 cup flour\n2 eggs\n1 cup milk\n2 tbsp sugar\n1 tsp baking powder\nPinch of salt', '1. Mix dry ingredients\n2. Add eggs and milk\n3. Whisk until smooth\n4. Cook on medium heat\n5. Flip when bubbles form', 15, 'Breakfast', 'https://images.unsplash.com/photo-1528207776546-365bb710ee93', TRUE),
(1, 'Spaghetti Carbonara', 'Creamy Italian pasta dish', '400g spaghetti\n200g bacon\n4 eggs\n100g parmesan\nBlack pepper\nSalt', '1. Cook pasta\n2. Fry bacon\n3. Mix eggs and cheese\n4. Combine all with pasta water\n5. Serve immediately', 20, 'Dinner', 'https://images.unsplash.com/photo-1612874742237-6526221588e3', FALSE),
(1, 'Caesar Salad', 'Fresh and crispy salad', 'Romaine lettuce\nCroutons\nParmesan cheese\nCaesar dressing\nChicken breast (optional)', '1. Chop lettuce\n2. Grill chicken if using\n3. Mix with dressing\n4. Add croutons and cheese\n5. Toss and serve', 10, 'Salad', 'https://images.unsplash.com/photo-1546793665-c74683f339c1', FALSE),
(1, 'Chocolate Chip Cookies', 'Chewy homemade cookies', '2 cups flour\n1 cup butter\n3/4 cup sugar\n2 eggs\n2 cups chocolate chips\n1 tsp vanilla\n1 tsp baking soda', '1. Cream butter and sugar\n2. Add eggs and vanilla\n3. Mix in dry ingredients\n4. Fold in chocolate chips\n5. Bake at 350°F for 12 minutes', 25, 'Dessert', 'https://images.unsplash.com/photo-1499636136210-6f4ee915583e', TRUE);
