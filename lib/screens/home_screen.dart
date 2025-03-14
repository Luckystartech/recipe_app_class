import 'package:flutter/material.dart';
import 'package:recipe_app/api/recipe_api_service.dart';
import 'package:recipe_app/utils/color.dart';
import 'package:recipe_app/widgets/recipe_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: recipeAppScaffoldBgColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Embark On Your Cooking Journey',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: recipeAppPrimaryColor,
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search',
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle:
                                const TextStyle(color: recipeAppPrimaryColor),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                          height: 56,
                          width: 56,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: const Icon(Icons.filter_alt_outlined))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: recipeAppPrimaryColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 32,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Special',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.food_bank,
                              color: recipeAppPrimaryColor,
                              size: 32,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Breakfast',
                              style: TextStyle(
                                  color: recipeAppPrimaryColor, fontSize: 16),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Need to try', style: TextStyle(fontSize: 32)),
                      TextButton.icon(
                        iconAlignment: IconAlignment.end,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: recipeAppPrimaryColor,
                        ),
                        label: const Text('See All',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: recipeAppPrimaryColor)),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 390,
                    child: FutureBuilder(
                        future: fetchRecipes(),
                        builder: (context, snapShot) {
                          if (snapShot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }

                          if (snapShot.hasError ||
                              snapShot.data == null ||
                              snapShot.data!.isEmpty) {
                            return  const Center(child: Text('No recipe Found'));
                          }
                          final recipes = snapShot.data!;
                          return ListView.separated(
                            itemCount: recipes.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return RecipeCard(recipe: recipes[index]);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 10
                              );
                            },
                          );
                        }),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Summer Selection',
                          style: TextStyle(fontSize: 32)),
                      TextButton.icon(
                        iconAlignment: IconAlignment.end,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: recipeAppPrimaryColor,
                        ),
                        label: const Text('See All',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: recipeAppPrimaryColor)),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  // RecipeCard(
                  //   width: MediaQuery.sizeOf(context).width,
                  //   height: 450,
                  //   imageHeight: 300,
                  //   isCard: false,
                  // ),
                ],
              ),
            ),
          ),
        ));
  }
}
