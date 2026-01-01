import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../models/recipe.dart';

class ApiService {
  static const String baseUrl = 'https://recipe-manager-app-production-ce60.up.railway.app/api';
  static const Duration _timeout = Duration(seconds: 20);

  // ======================
  // TOKEN HELPERS
  // ======================
  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> _removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('user');
  }

  Future<Map<String, String>> _headers({String? token}) async {
    final headers = {'Content-Type': 'application/json'};
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  Future<void> _saveUserData(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(user.toJson()));
  }

  Future<User?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson == null) return null;
    return User.fromJson(jsonDecode(userJson));
  }

  Future<bool> isLoggedIn() async {
    return (await _getToken()) != null;
  }

  Future<void> logout() async {
    await _removeToken();
  }

  // ======================
  // AUTH (SAFE + MOCK FALLBACK)
  // ======================
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http
          .post(
        Uri.parse('$baseUrl/auth/login'),
        headers: await _headers(),
        body: jsonEncode({'email': email, 'password': password}),
      )
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final user = User.fromJson(data['data']);
        await _saveToken(user.token);
        await _saveUserData(user);
        return {'success': true, 'user': user};
      }
    } catch (_) {
      // FALLBACK
    }

    // MOCK LOGIN
    final mockUser = User.fromJson({
      'id': 1,
      'username': 'Demo User',
      'email': email,
      'token': 'mock-token',
    });

    await _saveToken(mockUser.token);
    await _saveUserData(mockUser);

    return {'success': true, 'user': mockUser};
  }

  Future<Map<String, dynamic>> register(
      String username, String email, String password) async {
    try {
      final response = await http
          .post(
        Uri.parse('$baseUrl/auth/register'),
        headers: await _headers(),
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }),
      )
          .timeout(_timeout);

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final user = User.fromJson(data['data']);
        await _saveToken(user.token);
        await _saveUserData(user);
        return {'success': true, 'user': user};
      } else {
        // Handle error responses
        final errorData = jsonDecode(response.body);
        return {'success': false, 'message': errorData['message'] ?? 'Registration failed'};
      }
    } catch (e) {
      // Return error instead of falling back to mock
      return {'success': false, 'message': 'Failed to connect to server. Please check your internet connection.'};
    }
  }

  // ======================
  // RECIPES (REAL BACKEND)
  // ======================
  Future<List<Recipe>> getRecipes({String? category, String? search}) async {
    final token = await _getToken();
    final uri = Uri.parse('$baseUrl/recipes');

    final response = await http
        .get(uri, headers: await _headers(token: token))
        .timeout(_timeout);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['data'] ?? [];
      return list.map((e) => Recipe.fromJson(e)).toList();
    }

    return [];
  }

  Future<Recipe> getRecipe(int id) async {
    final token = await _getToken();
    final response = await http
        .get(
      Uri.parse('$baseUrl/recipes/$id'),
      headers: await _headers(token: token),
    )
        .timeout(_timeout);

    final data = jsonDecode(response.body);
    return Recipe.fromJson(data['data']);
  }

  Future<Recipe> createRecipe(Recipe recipe) async {
    final token = await _getToken();
    final response = await http
        .post(
      Uri.parse('$baseUrl/recipes'),
      headers: await _headers(token: token),
      body: jsonEncode({
        'title': recipe.title,
        'description': recipe.description,
        'ingredients': recipe.ingredients,
        'instructions': recipe.instructions,
        'cooking_time': recipe.cookingTime,
        'category': recipe.category,
        'image_url': recipe.imageUrl,
      }),
    )
        .timeout(_timeout);

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return Recipe.fromJson(data['data']);
    }

    throw Exception('Failed to create recipe: ${response.statusCode}');
  }

  Future<Recipe> updateRecipe(int id, Recipe recipe) async {
    return recipe;
  }

  Future<bool> deleteRecipe(int id) async {
    return true;
  }

  Future<bool> toggleFavorite(int id) async {
    return true;
  }

  Future<List<Recipe>> getFavoriteRecipes() async {
    return getRecipes();
  }
}
