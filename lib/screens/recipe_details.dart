import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/utils/color.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment:  AlignmentDirectional.topCenter,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.5,
            decoration:  BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(recipe.image),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Icon(
                        Icons.arrow_back,
                        // size: 32,
                      )),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Icon(
                        Icons.bookmark_border,
                        size: 32,
                      )),
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: BottomSheet(
          // showDragHandle: true,
          // enableDrag: false,
          onClosing: () {},
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.6,
                width: MediaQuery.sizeOf(context).width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(recipe.name,
                          style: const TextStyle(fontSize: 32)),
                      SizedBox(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: TextButton.icon(
                                onPressed: () {},
                                label: const Text(
                                  '1h',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: recipeAppPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                icon: const Icon(Icons.alarm,
                                    size: 12, color: recipeAppPrimaryColor),
                                style: TextButton.styleFrom(
                                    // fixedSize: const Size(30, 10),
                                    padding: const EdgeInsets.symmetric(),
                                    backgroundColor:
                                        recipeAppPrimaryColor.withAlpha(30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16))),
                              ),
                            ),
                            Flexible(
                              child: TextButton.icon(
                                onPressed: () {},
                                label:  Text(
                                  recipe.difficulty,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: recipeAppPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                icon: const Icon(Icons.alarm,
                                    size: 12, color: recipeAppPrimaryColor),
                                style: TextButton.styleFrom(
                                    // fixedSize: const Size(90, 30),
                                    padding: const EdgeInsets.symmetric(),
                                    backgroundColor:
                                        recipeAppPrimaryColor.withAlpha(30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16))),
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              label:  Text(
                                '${recipe.caloriesPerServing} kCal',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: recipeAppPrimaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              icon: const Icon(Icons.alarm,
                                  size: 12, color: recipeAppPrimaryColor),
                              style: TextButton.styleFrom(
                                  // fixedSize: const Size(90, 30),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  backgroundColor:
                                      recipeAppPrimaryColor.withAlpha(30),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                          'In Flutter, SliverAppBar is a successor to the AppBar widget, which allows you to create the floating app bar effect. The SliverAppBar expands the AppBar when the screen is scrolled up and collapsed on scroll down.',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      const SizedBox(height: 20),
                      const Text('Ingredients', style: TextStyle(fontSize: 24)),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: recipe.ingredients.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(Icons.food_bank),
                              title: Text(recipe.ingredients[index]),
                              subtitle: const Text('12 oz'),
                              trailing: const Icon(Icons.check_circle),
                            );
                          }
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
