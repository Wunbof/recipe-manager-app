# Recipe Manager API Documentation

Base URL: `https://your-api-url.com/api`

## Authentication

All recipe endpoints require authentication using JWT Bearer token.

Include in headers:
```
Authorization: Bearer YOUR_JWT_TOKEN
```

---

## Endpoints

### 1. Register User

**POST** `/auth/register`

Create a new user account.

**Request Body:**
```json
{
  "username": "john_doe",
  "email": "john@example.com",
  "password": "password123"
}
```

**Response (201):**
```json
{
  "success": true,
  "message": "User registered successfully",
  "data": {
    "userId": 1,
    "username": "john_doe",
    "email": "john@example.com",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  }
}
```

**Error (400):**
```json
{
  "success": false,
  "message": "User already exists with this email or username"
}
```

---

### 2. Login User

**POST** `/auth/login`

Login to existing account.

**Request Body:**
```json
{
  "email": "john@example.com",
  "password": "password123"
}
```

**Response (200):**
```json
{
  "success": true,
  "message": "Login successful",
  "data": {
    "userId": 1,
    "username": "john_doe",
    "email": "john@example.com",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  }
}
```

**Error (401):**
```json
{
  "success": false,
  "message": "Invalid email or password"
}
```

---

### 3. Get All Recipes

**GET** `/recipes`

Get all recipes for authenticated user.

**Query Parameters:**
- `category` (optional): Filter by category
- `search` (optional): Search in title and description

**Example:**
```
GET /recipes?category=Breakfast&search=pancake
```

**Headers:**
```
Authorization: Bearer YOUR_TOKEN
```

**Response (200):**
```json
{
  "success": true,
  "data": [
    {
      "recipe_id": 1,
      "user_id": 1,
      "title": "Classic Pancakes",
      "description": "Fluffy and delicious",
      "ingredients": "1 cup flour\n2 eggs\n1 cup milk",
      "instructions": "1. Mix ingredients\n2. Cook on griddle",
      "cooking_time": 15,
      "category": "Breakfast",
      "image_url": "https://example.com/image.jpg",
      "is_favorite": true,
      "created_at": "2024-01-15T10:30:00.000Z",
      "updated_at": "2024-01-15T10:30:00.000Z"
    }
  ],
  "count": 1
}
```

---

### 4. Get Single Recipe

**GET** `/recipes/:id`

Get details of a specific recipe.

**Headers:**
```
Authorization: Bearer YOUR_TOKEN
```

**Response (200):**
```json
{
  "success": true,
  "data": {
    "recipe_id": 1,
    "user_id": 1,
    "title": "Classic Pancakes",
    "description": "Fluffy and delicious",
    "ingredients": "1 cup flour\n2 eggs\n1 cup milk",
    "instructions": "1. Mix ingredients\n2. Cook on griddle",
    "cooking_time": 15,
    "category": "Breakfast",
    "image_url": "https://example.com/image.jpg",
    "is_favorite": true,
    "created_at": "2024-01-15T10:30:00.000Z",
    "updated_at": "2024-01-15T10:30:00.000Z"
  }
}
```

**Error (404):**
```json
{
  "success": false,
  "message": "Recipe not found"
}
```

---

### 5. Create Recipe

**POST** `/recipes`

Create a new recipe.

**Headers:**
```
Authorization: Bearer YOUR_TOKEN
```

**Request Body:**
```json
{
  "title": "Chocolate Cake",
  "description": "Rich and moist chocolate cake",
  "ingredients": "2 cups flour\n1 cup cocoa\n2 eggs\n1 cup sugar",
  "instructions": "1. Mix dry ingredients\n2. Add wet ingredients\n3. Bake at 350F",
  "cooking_time": 45,
  "category": "Dessert",
  "image_url": "https://example.com/cake.jpg"
}
```

**Response (201):**
```json
{
  "success": true,
  "message": "Recipe created successfully",
  "data": {
    "recipe_id": 5,
    "user_id": 1,
    "title": "Chocolate Cake",
    "description": "Rich and moist chocolate cake",
    "ingredients": "2 cups flour\n1 cup cocoa\n2 eggs\n1 cup sugar",
    "instructions": "1. Mix dry ingredients\n2. Add wet ingredients\n3. Bake at 350F",
    "cooking_time": 45,
    "category": "Dessert",
    "image_url": "https://example.com/cake.jpg",
    "is_favorite": false,
    "created_at": "2024-01-15T11:00:00.000Z",
    "updated_at": "2024-01-15T11:00:00.000Z"
  }
}
```

---

### 6. Update Recipe

**PUT** `/recipes/:id`

Update an existing recipe.

**Headers:**
```
Authorization: Bearer YOUR_TOKEN
```

**Request Body:**
```json
{
  "title": "Updated Chocolate Cake",
  "description": "Even better chocolate cake",
  "ingredients": "2 cups flour\n1.5 cups cocoa\n3 eggs\n1 cup sugar",
  "instructions": "1. Mix dry ingredients\n2. Add wet ingredients\n3. Bake at 350F for 45min",
  "cooking_time": 50,
  "category": "Dessert",
  "image_url": "https://example.com/new-cake.jpg",
  "is_favorite": true
}
```

**Response (200):**
```json
{
  "success": true,
  "message": "Recipe updated successfully",
  "data": {
    "recipe_id": 5,
    "user_id": 1,
    "title": "Updated Chocolate Cake",
    ...
  }
}
```

---

### 7. Delete Recipe

**DELETE** `/recipes/:id`

Delete a recipe.

**Headers:**
```
Authorization: Bearer YOUR_TOKEN
```

**Response (200):**
```json
{
  "success": true,
  "message": "Recipe deleted successfully"
}
```

**Error (404):**
```json
{
  "success": false,
  "message": "Recipe not found"
}
```

---

### 8. Toggle Favorite

**PATCH** `/recipes/:id/favorite`

Toggle favorite status of a recipe.

**Headers:**
```
Authorization: Bearer YOUR_TOKEN
```

**Response (200):**
```json
{
  "success": true,
  "message": "Recipe added to favorites",
  "data": {
    "is_favorite": true
  }
}
```

---

### 9. Get Favorite Recipes

**GET** `/recipes/favorites/list`

Get all favorite recipes.

**Headers:**
```
Authorization: Bearer YOUR_TOKEN
```

**Response (200):**
```json
{
  "success": true,
  "data": [
    {
      "recipe_id": 1,
      "title": "Classic Pancakes",
      "is_favorite": true,
      ...
    }
  ],
  "count": 1
}
```

---

## Error Codes

| Code | Description |
|------|-------------|
| 200 | Success |
| 201 | Created |
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |
| 500 | Server Error |

---

## Testing with cURL

### Register
```bash
curl -X POST https://your-api.com/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"username":"test","email":"test@test.com","password":"test123"}'
```

### Login
```bash
curl -X POST https://your-api.com/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@test.com","password":"test123"}'
```

### Get Recipes
```bash
curl -X GET https://your-api.com/api/recipes \
  -H "Authorization: Bearer YOUR_TOKEN"
```

### Create Recipe
```bash
curl -X POST https://your-api.com/api/recipes \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"title":"Test Recipe","ingredients":"Test","instructions":"Test"}'
```

---

## Rate Limiting

No rate limiting currently implemented. For production, consider adding rate limiting middleware.

---

## CORS

CORS is enabled for all origins. For production, configure specific origins in backend.

---

## Security Notes

- All passwords are hashed using bcrypt
- JWT tokens expire after 30 days
- HTTPS recommended for production
- Never commit `.env` file to version control
