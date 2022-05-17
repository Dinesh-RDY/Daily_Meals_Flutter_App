import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/Meal_detail_screen.dart';
import 'package:flutter_complete_guide/screens/filtersScreen.dart';
import 'package:flutter_complete_guide/screens/tabscreen.dart';
import './screens/categories_meals_screen.dart';

//import './screens//categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> availablemeals = DUMMY_MEALS;

  void setFilter(Map<String, bool> filteredData) {
    setState(() {
      filters = filteredData;
      // ignore: missing_return
      availablemeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten']! && !meal.isGlutenFree) return false;
        if (filters['vegan']! && !meal.isVegan) return false;
        if (filters['lactose']! && !meal.isLactoseFree) return false;
        if (filters['vegetarian']! && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  List<Meal> favouriteMeals = [];

  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'DeliMeals',
      theme: ThemeData(
        /*  appBarTheme: AppBarTheme(
            color: Colors.yellow,
            centerTitle: true,
            textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                    fontFamily: "Raleway",
                    fontSize: 25,
                    fontWeight: FontWeight.bold))), */
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 21, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 20, 51, 1),
                fontFamily: "RobotoCondensed",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              headline1: TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              headline2: TextStyle(
                color: Colors.white,
                fontFamily: "RobotoCondensed",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              headline3: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: "Raleway",
              ),
            ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),
      ),
      //home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(favouriteMeals),
        MealsScreen.mealsroute: (ctx) => MealsScreen(availablemeals),
        MealDetails.mealdetailroute: (ctx) => MealDetails(),
        Filters.filtersRoute: (ctx) => Filters(filters, setFilter),
      },
    );
  }
}
