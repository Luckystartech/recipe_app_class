import 'dart:convert';

import 'package:recipe_app/models/recipe.dart';
import 'package:http/http.dart' as http;

Future<List<Recipe>> fetchRecipes() async {
  const url = 'https://dummyjson.com/recipes';
  try {
    final response = await http.get(Uri.parse(url)); // making the request
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['recipes'] as List;

      final recipes = data.map((recipe) => Recipe.fromMap(recipe)).toList();
      return recipes;
    } else {
      throw Exception('Failed to fetch Recipe');
    }
  } catch (e) {
    print(e.toString());
    throw Exception('Failed to fetch Recipe');
  }
}

// void main() async{
//   final recipes = await fetchRecipes();
//   print(recipes);
// }
