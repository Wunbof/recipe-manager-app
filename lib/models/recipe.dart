class Recipe {
  final int? recipeId;
  final int? userId;
  final String title;
  final String? description;
  final String ingredients;
  final String instructions;
  final int? cookingTime;
  final String? category;
  final String? imageUrl;
  final bool isFavorite;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Recipe({
    this.recipeId,
    this.userId,
    required this.title,
    this.description,
    required this.ingredients,
    required this.instructions,
    this.cookingTime,
    this.category,
    this.imageUrl,
    this.isFavorite = false,
    this.createdAt,
    this.updatedAt,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      recipeId: json['recipe_id'],
      userId: json['user_id'],
      title: json['title'],
      description: json['description'],
      ingredients: json['ingredients'],
      instructions: json['instructions'],
      cookingTime: json['cooking_time'],
      category: json['category'],
      imageUrl: json['image_url'],
      isFavorite: json['is_favorite'] == 1 || json['is_favorite'] == true,
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : null,
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recipe_id': recipeId,
      'user_id': userId,
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'instructions': instructions,
      'cooking_time': cookingTime,
      'category': category,
      'image_url': imageUrl,
      'is_favorite': isFavorite,
    };
  }

  Recipe copyWith({
    int? recipeId,
    int? userId,
    String? title,
    String? description,
    String? ingredients,
    String? instructions,
    int? cookingTime,
    String? category,
    String? imageUrl,
    bool? isFavorite,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Recipe(
      recipeId: recipeId ?? this.recipeId,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      cookingTime: cookingTime ?? this.cookingTime,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
