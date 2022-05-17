import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/favoriteScreen.dart';
import 'package:flutter_complete_guide/widgets/tab.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favourites;
  TabsScreen(this.favourites);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> screens =[];
  initState() {
    screens = [
      {
        'page': CategoriesScreen(),
        'title': "Categories",
      },
      {
        'page': FavoriteScreen(widget.favourites),
        'title': "Favourites",
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  void selectScreen(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /* return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favourites",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  } */
    return Scaffold(
      appBar: AppBar(
        title: Text(
          screens[_selectedPageIndex]['title'] as String,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      drawer: MainTab(),
      body: screens[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) => selectScreen(i),
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: "Categories"),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
