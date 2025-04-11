import 'dart:convert';

import 'package:recipe_app/models/recipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveData({required List<Recipe> recipes}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  //converted to Map
  final List<Map<String, dynamic>> recipeMap =
      recipes.map((recipe) => recipe.toMap()).toList();

  //converted to String
  final List<String> recipeString =
      recipeMap.map((v) => jsonEncode(v)).toList();

  prefs.setStringList('bookmark', recipeString);
}



Future<List<Recipe>> loadData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final List<String>? recipeString = prefs.getStringList('bookmark');

  if (recipeString != null) {
    final List<Map<String, dynamic>> recipeMap =
        recipeString.map((v) => jsonDecode(v) as Map<String, dynamic>).toList();

    final List<Recipe> recipes =
        recipeMap.map((v) => Recipe.fromMap(v)).toList();
    return recipes;
  } else {
    throw Exception('bookmark cannot be found');
  }
}
