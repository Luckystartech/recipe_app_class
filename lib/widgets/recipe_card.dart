import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/screens/recipe_details.dart';
import 'package:recipe_app/utils/color.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    this.width = 200,
    this.height = 360,
    this.imageHeight = 200,
    this.isCard = true,
    required this.recipe,
  });
  final Recipe recipe;
  final double width;
  final double imageHeight;
  final double height;
  final bool isCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>  RecipeDetails(recipe: recipe,)));
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: width,
                  height: imageHeight,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                      color: recipeAppPrimaryColor.withAlpha(30),
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.network(
                    recipe.image,
                    fit: BoxFit.cover,
                  ),
                ),
                if (isCard)
                  Positioned(
                      top: 5,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: const Icon(
                              Icons.bookmark_border,
                              size: 18,
                            )),
                      ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                    'Create an sRGB color from red, green, blue, and opacity, similar to rgba'),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
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
                          backgroundColor: recipeAppPrimaryColor.withAlpha(30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                  ),
                  Flexible(
                    child: TextButton.icon(
                      onPressed: () {},
                      label: const Text(
                        'Easy',
                        style: TextStyle(
                            fontSize: 12,
                            color: recipeAppPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      icon: const Icon(Icons.alarm,
                          size: 12, color: recipeAppPrimaryColor),
                      style: TextButton.styleFrom(
                          // fixedSize: const Size(90, 30),
                          padding: const EdgeInsets.symmetric(),
                          backgroundColor: recipeAppPrimaryColor.withAlpha(30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: const Text(
                      '300 kCal',
                      style: TextStyle(
                          fontSize: 12,
                          color: recipeAppPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    icon: const Icon(Icons.alarm,
                        size: 12, color: recipeAppPrimaryColor),
                    style: TextButton.styleFrom(
                        // fixedSize: const Size(90, 30),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        backgroundColor: recipeAppPrimaryColor.withAlpha(30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
