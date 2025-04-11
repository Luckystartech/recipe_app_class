import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/local_storage/local_storage.dart';
import 'package:recipe_app/models/recipe.dart';

class BookMarkNotifier extends StateNotifier<List<Recipe>> {
  BookMarkNotifier() : super([]) {
    init();
  }

  void addToBookMark(Recipe recipe) {
    state = [...state, recipe];
    saveData(recipes: state);
  }

  void init() async {
    try {
      final recipes = await loadData();
      state = [...recipes];
    } catch (e) {
      print(e.toString());
      state = [];
    }
  }

  void deleteFromBookMark(Recipe recipe) {
    final index = state.indexOf(recipe);
    state.removeAt(index);
    state = [...state];
    saveData(recipes: state);
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
