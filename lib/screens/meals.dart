import 'package:flutter/material.dart';
import 'package:meals_app_flutter/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(context) {
    if (meals.isEmpty) {
      return const Center(
        child: Text('No meals available'),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(meals[index].title),
            );
          },
        ),
      );
    }
  }
}
