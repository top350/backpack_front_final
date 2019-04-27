import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import './items/item_list.dart';

import 'database/db_account.dart';
import 'database/db_request.dart';

class Dashboard extends StatefulWidget {
  // Class for homePage where you can chose category
  AccountObject currentUser; //Receive from Home
  Dashboard(this.currentUser);

  @override
  _DashboardState createState() => _DashboardState(currentUser);
}

class _DashboardState extends State<Dashboard> {
  AccountObject currentUser; //Receive from Home
  _DashboardState(this.currentUser);
  
  String categoryName = ''; //Send to Backend

  Material myItems(IconData icon, String heading, int color1) {
    return Material(
      color: Color(color1),
      elevation: 10.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Color(color1),
                        size: 30.0,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category',
            style: TextStyle(
              color: Colors.white,
            )),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 35.0,
        ),
        children: <Widget>[
          GestureDetector(
            onTap: () {
              categoryName = 'Stationery';
              print(categoryName);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ItemList("Stationery", convertToCard(stationeryList,currentUser))),
              );
            },
            child: myItems(Icons.edit, "Stationery ", 0xffF7B79B),
          ),
          GestureDetector(
            onTap: () {
              categoryName = 'Clothing';
              print(categoryName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ItemList("Clothing", convertToCard(clothingList,currentUser)),
                ),
              );
            },
            child: myItems(Icons.wc, "Clothing", 0xff74E183),
          ),
          GestureDetector(
            onTap: () {
              categoryName = 'Sport Equipment';
              print(categoryName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemList(
                      "Sport Equipment", convertToCard(sportEquipmentList,currentUser)),
                ),
              );
            },
            child: myItems(Icons.fitness_center, "Sport Equip.", 0xff6BA9E8),
          ),
          GestureDetector(
            onTap: () {
              categoryName = 'Electronics';
              print(categoryName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ItemList("Electronics", convertToCard(electronicsList,currentUser)),
                ),
              );
            },
            child: myItems(Icons.usb, "Electronics ", 0xFFEC90D4),
          ),
          GestureDetector(
            onTap: () {
              categoryName = 'Books';
              print(categoryName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ItemList("Books", convertToCard(booksList,currentUser)),
                ),
              );
            },
            child: myItems(Icons.book, "Books", 0xFF81C784),
          ),
          GestureDetector(
            onTap: () {
              categoryName = 'Others';
              print(categoryName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ItemList("Others", convertToCard(othersList,currentUser)),
                ),
              );
            },
            child: myItems(Icons.graphic_eq, "Others", 0xFFDEB887),
          ),
        ],
        staggeredTiles: [
          StaggeredTile.extent(1, 150.0), //Stationery
          StaggeredTile.extent(1, 150.0), //Clothing
          StaggeredTile.extent(1, 150.0), //Sport Equipment
          StaggeredTile.extent(1, 150.0), //Electronics
          StaggeredTile.extent(1, 150.0), //Books
          StaggeredTile.extent(1, 150.0), //Others
        ],
      ),
    );
  }
}
