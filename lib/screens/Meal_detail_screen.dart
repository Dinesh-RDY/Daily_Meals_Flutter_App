

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static final mealdetailroute = "MealDetails";

  Widget createHeadline(String string, BuildContext ctx) {
    return Text(
      string,
      style: Theme.of(ctx).textTheme.bodyText2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final id = ModalRoute.of(context)!.settings.arguments;
    final meal = DUMMY_MEALS.firstWhere((meals) => meals.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text("${meal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: height * 0.3,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
              width: double.infinity,
            ),
            SizedBox(
              height: height * 0.02,
              child: Container(
                color: Colors.grey,
                width: double.infinity,
                margin: EdgeInsets.all(5),
                height: 0.5,
              ),
            ),
            createHeadline("Ingredients", context),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.symmetric(vertical: 10),
              height: height * 0.3,
              width: width * 0.7,
              child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    //color: Colors.amber,
                    child: Text(
                      " ${index + 1} ) ${meal.ingredients[index]}",
                    ),
                    margin: EdgeInsets.all(10),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.02,
              child: Container(
                color: Colors.grey,
                width: double.infinity,
                margin: EdgeInsets.all(5),
                height: 0.5,
              ),
            ),
            createHeadline("Steps :)", context),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.symmetric(vertical: 10),
              height: height * 0.3,
              width: width * 0.7,
              child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 15,
                      child: Text("${index + 1}"),
                    ),
                    title: Card(
                      //color: Colors.amber,
                      child: Text(
                        " ${meal.steps[index]}",
                      ),
                      margin: EdgeInsets.all(10),
                      elevation: 5,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back,),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
