import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/providers/bookmark_provider.dart';
import 'package:recipe_app/screens/recipe_details.dart';
import 'package:recipe_app/utils/color.dart';

class RecipeCard extends ConsumerStatefulWidget {
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
  ConsumerState<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends ConsumerState<RecipeCard> {
  // late bool isBookMarked;

  // @override
  // void initState() {
  //   isBookMarked = false;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final bookMark = ref.watch(bookMarkProvider);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecipeDetails(
                  recipe: widget.recipe,
                )));
      },
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: widget.width,
                  height: widget.imageHeight,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                      color: recipeAppPrimaryColor.withAlpha(30),
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.network(
                    widget.recipe.image,
                    fit: BoxFit.cover,
                  ),
                ),
                if (widget.isCard)
                  Positioned(
                      top: 5,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          ref
                              .read(bookMarkProvider.notifier)
                              .toggleBookMark(widget.recipe);
                          // setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          child: Icon(
                            bookMark.contains(widget.recipe)
                                ? Icons.bookmark_outlined
                                : Icons.bookmark_border_outlined,
                            size: 18,
                            color: recipeAppPrimaryColor,
                          ),
                        ),
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
                  widget.recipe.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
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
