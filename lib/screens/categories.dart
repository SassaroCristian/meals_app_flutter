import 'package:flutter/material.dart';
import 'package:meals_app_flutter/data/dummy_data.dart';
import 'package:meals_app_flutter/models/meal.dart';
import 'package:meals_app_flutter/screens/meals.dart';
import 'package:meals_app_flutter/widget/category_grid_item.dart';
import 'package:meals_app_flutter/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavourite,
    required this.avaiableMeals,
  });

  final List<Meal> avaiableMeals;
  final void Function(Meal meal) onToggleFavourite;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = avaiableMeals
        .where((meals) => meals.categories.contains(category.id))
        .toList();

    // Navigator.push(context, route); same thing
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavourite: onToggleFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return GridView(
      padding: const EdgeInsets.all(6),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      children: [
        // alternative way
        // avaiableCategories.map((category)=> CategoryGridItem(category: category)).toList()
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(
                context,
                category,
              );
            },
          )
      ],
    );
  }
}
