import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favorites;
  FavoriteScreen(this.favorites);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("You do not have any favourites-Why not add some"),
    );
  }
}
