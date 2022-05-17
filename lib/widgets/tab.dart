import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/filtersScreen.dart';

class MainTab extends StatelessWidget {
  ListTile gettile(String title, IconData icon, final VoidCallback tap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 22,
        ),
      ),
      leading: Icon(
        icon,
        size: 25,
      ),
      onTap: tap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.3,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              "Cooking up",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          gettile("Meals", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          gettile("Settings", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(Filters.filtersRoute);
          }),
        ],
      ),
    );
  }
}
