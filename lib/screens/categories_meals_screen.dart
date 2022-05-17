import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';


class MealsScreen extends StatelessWidget {
  /* final String id;
  final String title;
  MealsScreen(this.id, this.title); */
  static final mealsroute = 'Meals_screen_route';
  final List<Meal> availablemeals;
  MealsScreen(this.availablemeals);
  @override
  Widget build(BuildContext context) {
    final routeargs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final title = routeargs['title'];
    final id = routeargs['id'];
    final categoricalmeals = availablemeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var item = categoricalmeals[index];
          return MealItem(
            url: item.imageUrl,
            affordability: item.affordability,
            complexity: item.complexity,
            duration: item.duration,
            title: item.title,
            id: item.id,
          );
        },
        itemCount: categoricalmeals.length,
      ),
    );
  }
}
