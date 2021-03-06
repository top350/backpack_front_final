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
  String categoryName = ''; //Send to Backend
  List<RequestObject> receiveRequestList = requestList; //Receive from Backend

  AccountObject currentUser; //Receive from Home
  _DashboardState(this.currentUser);

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
              //Send/Receive When pressed this
              categoryName = 'Stationery';
              print(categoryName);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemList(
                        "Stationery",
                        convertToCard(
                            sortCategory('Stationery', receiveRequestList),
                            currentUser))),
              );
            },
            child: myItems(Icons.edit, "Stationery ", 0xffF7B79B),
          ),
          GestureDetector(
            onTap: () {
              //Send/Receive When pressed this
              categoryName = 'Clothing';
              print(categoryName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemList(
                      "Clothing",
                      convertToCard(
                          sortCategory('Clothing', receiveRequestList),
                          currentUser)),
                ),
              );
            },
            child: myItems(Icons.wc, "Clothing", 0xff74E183),
          ),
          GestureDetector(
            onTap: () {
              //Send/Receive When pressed this
              categoryName = 'Sport Equipment';
              print(categoryName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemList(
                      "Sport Equipment",
                      convertToCard(
                          sortCategory('Sport Equipment', receiveRequestList),
                          currentUser)),
                ),
              );
            },
            child: myItems(Icons.fitness_center, "Sport Equip.", 0xff6BA9E8),
          ),
          GestureDetector(
            onTap: () {
              //Send/Receive When pressed this
              categoryName = 'Electronics';
              print(categoryName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemList(
                      "Electronics",
                      convertToCard(
                          sortCategory('Electronics', receiveRequestList),
                          currentUser)),
                ),
              );
            },
            child: myItems(Icons.usb, "Electronics ", 0xFFEC90D4),
          ),
          GestureDetector(
            onTap: () {
              //Send/Receive When pressed this
              categoryName = 'Books';
              print(categoryName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemList(
                      "Books",
                      convertToCard(sortCategory('Books', receiveRequestList),
                          currentUser)),
                ),
              );
            },
            child: myItems(Icons.book, "Books", 0xFF81C784),
          ),
          GestureDetector(
            onTap: () {
              //Send/Receive When pressed this
              categoryName = 'Others';
              print(categoryName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemList(
                      "Others",
                      convertToCard(sortCategory('Others', receiveRequestList),
                          currentUser)),
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
