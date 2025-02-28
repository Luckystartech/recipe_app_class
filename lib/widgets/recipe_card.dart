import 'package:flutter/material.dart';
import 'package:recipe_app/utils/color.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 400,
      child: Column(
        
        children: [
          Container(
            // width: 200,
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              color: recipeAppPrimaryColor.withAlpha(30),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Image.asset('assets/images/recipe_image.jpg', fit: BoxFit.cover,),
          ),
          const SizedBox(height: 10,),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Morning Pancakes', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Text(
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
                    label: const Text('1h', style: TextStyle(fontSize: 12, color: recipeAppPrimaryColor, fontWeight: FontWeight.bold),),
                    icon: const Icon(Icons.alarm, size: 12, color: recipeAppPrimaryColor),
                    style: TextButton.styleFrom(
                      // fixedSize: const Size(30, 10),
                      padding:   const EdgeInsets.symmetric(),
                      backgroundColor: recipeAppPrimaryColor.withAlpha(30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      )
                    ),
                  ),
                ),
                Flexible(
                  child: TextButton.icon(
                    onPressed: () {},
                    label: const Text('Easy', style: TextStyle(fontSize: 12, color: recipeAppPrimaryColor, fontWeight: FontWeight.bold),),
                    icon: const Icon(Icons.alarm, size: 12, color: recipeAppPrimaryColor),
                    style: TextButton.styleFrom(
                      // fixedSize: const Size(90, 30),
                      padding:   const EdgeInsets.symmetric(),
                      backgroundColor: recipeAppPrimaryColor.withAlpha(30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      )
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  label: const Text('300 kCal', style: TextStyle(fontSize: 12, color: recipeAppPrimaryColor, fontWeight: FontWeight.bold),),
                  icon: const Icon(Icons.alarm, size: 12, color: recipeAppPrimaryColor),
                  style: TextButton.styleFrom(
                    // fixedSize: const Size(90, 30),
                    padding:   const EdgeInsets.symmetric(horizontal: 4),
                    backgroundColor: recipeAppPrimaryColor.withAlpha(30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    )
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
