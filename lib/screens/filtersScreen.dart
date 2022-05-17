import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/tab.dart';

class Filters extends StatefulWidget {
  static final filtersRoute = "Filters";
  final Function filterList;
  final Map<String, bool> updateFilter;

  Filters(this.updateFilter, this.filterList);
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool isvegan = false;
  bool isvegetarian = false;
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  @override
  initState() {
    isvegan = widget.updateFilter['vegan']!;
    isvegetarian = widget.updateFilter['vegetarian']!;
    isGlutenFree = widget.updateFilter['gluten']!;
    isLactoseFree = widget.updateFilter['lactose']!;
    super.initState();
  }

  Widget buildSwitch(
      String title, String description, bool currentvalue,update) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
      subtitle: Text(
        description,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      value: currentvalue,
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters Screen"),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> filter = {
                  'gluten': isGlutenFree,
                  'lactose': isLactoseFree,
                  'vegan': isvegan,
                  'vegetarian': isvegetarian,
                };
                widget.filterList(filter);
              },
            )
          ],
        ),
        drawer: MainTab(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Adjust your meals",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitch("Is vegan", "Show items that are vegan", isvegan,
                      (val) {
                    setState(() {
                      isvegan = val;
                    });
                  }),
                  buildSwitch("Is vegetarian", "Show items that are vegetarian",
                      isvegetarian, (val) {
                    setState(() {
                      isvegetarian = val;
                    });
                  }),
                  buildSwitch("Is Lactose free",
                      "Show items that are Lactose free", isLactoseFree, (val) {
                    setState(() {
                      isLactoseFree = val;
                    });
                  }),
                  buildSwitch("Is Gluten free",
                      "Show items that are Gluten free", isGlutenFree, (val) {
                    setState(() {
                      isGlutenFree = val;
                    });
                  })
                ],
              ),
            )
          ],
        ));
  }
}
