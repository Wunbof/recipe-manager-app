const express = require('express');
const router = express.Router();
const { pool } = require('../config/database');
const { authenticateToken } = require('../middleware/auth');

// Get all recipes for logged-in user
router.get('/', authenticateToken, async (req, res) => {
  try {
    const { category, search } = req.query;
    let query = 'SELECT * FROM recipes WHERE user_id = ?';
    let params = [req.user.userId];

    if (category) {
      query += ' AND category = ?';
      params.push(category);
    }

    if (search) {
      query += ' AND (title LIKE ? OR description LIKE ?)';
      params.push(`%${search}%`, `%${search}%`);
    }

    query += ' ORDER BY created_at DESC';

    const [recipes] = await pool.query(query, params);

    res.json({
      success: true,
      data: recipes,
      count: recipes.length
    });

  } catch (error) {
    console.error('Get recipes error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error fetching recipes'
    });
  }
});

// Get single recipe by ID
router.get('/:id', authenticateToken, async (req, res) => {
  try {
    const [recipes] = await pool.query(
      'SELECT * FROM recipes WHERE recipe_id = ? AND user_id = ?',
      [req.params.id, req.user.userId]
    );

    if (recipes.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Recipe not found'
      });
    }

    res.json({
      success: true,
      data: recipes[0]
    });

  } catch (error) {
    console.error('Get recipe error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error fetching recipe'
    });
  }
});

// Create new recipe
router.post('/', authenticateToken, async (req, res) => {
  try {
    const { title, description, ingredients, instructions, cooking_time, category, image_url } = req.body;

    // Validation
    if (!title || !ingredients || !instructions) {
      return res.status(400).json({
        success: false,
        message: 'Title, ingredients, and instructions are required'
      });
    }

    const [result] = await pool.query(
      `INSERT INTO recipes (user_id, title, description, ingredients, instructions, cooking_time, category, image_url) 
       VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
      [req.user.userId, title, description, ingredients, instructions, cooking_time, category, image_url]
    );

    // Fetch the created recipe
    const [newRecipe] = await pool.query(
      'SELECT * FROM recipes WHERE recipe_id = ?',
      [result.insertId]
    );

    res.status(201).json({
      success: true,
      message: 'Recipe created successfully',
      data: newRecipe[0]
    });

  } catch (error) {
    console.error('Create recipe error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error creating recipe'
    });
  }
});

// Update recipe
router.put('/:id', authenticateToken, async (req, res) => {
  try {
    const { title, description, ingredients, instructions, cooking_time, category, image_url, is_favorite } = req.body;

    // Check if recipe exists and belongs to user
    const [existingRecipes] = await pool.query(
      'SELECT * FROM recipes WHERE recipe_id = ? AND user_id = ?',
      [req.params.id, req.user.userId]
    );

    if (existingRecipes.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Recipe not found'
      });
    }

    await pool.query(
      `UPDATE recipes 
       SET title = ?, description = ?, ingredients = ?, instructions = ?, 
           cooking_time = ?, category = ?, image_url = ?, is_favorite = ?
       WHERE recipe_id = ? AND user_id = ?`,
      [title, description, ingredients, instructions, cooking_time, category, image_url, is_favorite, req.params.id, req.user.userId]
    );

    // Fetch updated recipe
    const [updatedRecipe] = await pool.query(
      'SELECT * FROM recipes WHERE recipe_id = ?',
      [req.params.id]
    );

    res.json({
      success: true,
      message: 'Recipe updated successfully',
      data: updatedRecipe[0]
    });

  } catch (error) {
    console.error('Update recipe error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error updating recipe'
    });
  }
});

// Toggle favorite status
router.patch('/:id/favorite', authenticateToken, async (req, res) => {
  try {
    const [recipes] = await pool.query(
      'SELECT is_favorite FROM recipes WHERE recipe_id = ? AND user_id = ?',
      [req.params.id, req.user.userId]
    );

    if (recipes.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Recipe not found'
      });
    }

    const newFavoriteStatus = !recipes[0].is_favorite;

    await pool.query(
      'UPDATE recipes SET is_favorite = ? WHERE recipe_id = ? AND user_id = ?',
      [newFavoriteStatus, req.params.id, req.user.userId]
    );

    res.json({
      success: true,
      message: `Recipe ${newFavoriteStatus ? 'added to' : 'removed from'} favorites`,
      data: { is_favorite: newFavoriteStatus }
    });

  } catch (error) {
    console.error('Toggle favorite error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error toggling favorite'
    });
  }
});

// Delete recipe
router.delete('/:id', authenticateToken, async (req, res) => {
  try {
    const [result] = await pool.query(
      'DELETE FROM recipes WHERE recipe_id = ? AND user_id = ?',
      [req.params.id, req.user.userId]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        success: false,
        message: 'Recipe not found'
      });
    }

    res.json({
      success: true,
      message: 'Recipe deleted successfully'
    });

  } catch (error) {
    console.error('Delete recipe error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error deleting recipe'
    });
  }
});

// Get favorite recipes
router.get('/favorites/list', authenticateToken, async (req, res) => {
  try {
    const [recipes] = await pool.query(
      'SELECT * FROM recipes WHERE user_id = ? AND is_favorite = TRUE ORDER BY created_at DESC',
      [req.user.userId]
    );

    res.json({
      success: true,
      data: recipes,
      count: recipes.length
    });

  } catch (error) {
    console.error('Get favorites error:', error);
    res.status(500).json({
      success: false,
      message: 'Server error fetching favorites'
    });
  }
});

module.exports = router;
