

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/Meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String url;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final  int duration;
  MealItem({
    required this.id,
    required this.url,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.duration,
  });
  String get complexityText {
    if (complexity == Complexity.Simple)
      return "simple";
    else if (complexity == Complexity.Hard)
      return "Hard";
    else
      return "Challenging";
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable)
      return "Affordable";
    else if (affordability == Affordability.Pricey)
      return "Pricey";
    else
      return "Luxurious";
  }

  void callDetailsScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetails.mealdetailroute,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: InkWell(
        onTap: () {
          callDetailsScreen(context);
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "$duration min",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          complexityText,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          affordabilityText,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /* Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
