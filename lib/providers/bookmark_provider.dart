import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/recipe.dart';

class BookMarkNotifier extends StateNotifier<List<Recipe>> {
  BookMarkNotifier() : super([]);

  void addToBookMark(Recipe recipe) {
    state = [...state, recipe];
  }

  void deleteFromBookMark(Recipe recipe) {
    final index = state.indexOf(recipe);
    state.removeAt(index);
    state = [...state];
  }

  void toggleBookMark(Recipe recipe) {
    if (state.contains(recipe)) {
      //remove from bookmark
      deleteFromBookMark(recipe);
    } else {
      //add to bookmark
      addToBookMark(recipe);
    }
    state = [...state];
  }
}

final bookMarkProvider =
    StateNotifierProvider<BookMarkNotifier, List<Recipe>>((ref) {
  return BookMarkNotifier();
});
