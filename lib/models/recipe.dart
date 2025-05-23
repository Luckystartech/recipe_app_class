import 'package:flutter/foundation.dart';

class Recipe {
  const Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.difficulty,
    required this.caloriesPerServing,
    required this.image,
  });

  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final String difficulty;
  final int caloriesPerServing;
  final String image;

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
        id: map['id'],
        name: map['name'],
        ingredients: (map['ingredients'] as List).cast<String>(),
        instructions: (map['instructions'] as List).cast<String>(),
        prepTimeMinutes: map['prepTimeMinutes'],
        difficulty: map['difficulty'],
        caloriesPerServing: map['caloriesPerServing'],
        image: map['image']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
      'prepTimeMinutes': prepTimeMinutes,
      'difficulty': difficulty,
      'caloriesPerServing': caloriesPerServing,
      'image': image
    };
  }

  @override
  String toString() {
    return '''
        Recipe(
          id: $id, 
          name: $name, 
          ingredients: $ingredients, 
          instructions: $instructions,
          prepTimeMinutes: $prepTimeMinutes,
          difficulty: $difficulty,
          caloriesPerServing: $caloriesPerServing,
          image: $image
        )
''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Recipe && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

//convert from json to Map, using json Decode
//convert from Map to Recipe Class
//pub.dev
