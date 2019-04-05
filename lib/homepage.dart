import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Material myItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
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
                      style: TextStyle(color: new Color(color), fontSize: 20.0),
                    ),
                  ),
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
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
              print("Statoinaries onTap called.");
            },
            child: myItems(Icons.edit, "Stationaries", 0xffed622b),
          ),
          GestureDetector(
            onTap: () {
              print("Clothes onTap called.");
            },
            child: myItems(Icons.wc, "Clothes", 0xff26cb3c),
          ),
          GestureDetector(
            onTap: () {
              print("Sportwares onTap called.");
            },
            child: myItems(Icons.directions_bike, "Sportwares", 0xffff3266),
          ),
          GestureDetector(
            onTap: () {
              print("Sport Equipment onTap called.");
            },
            child: myItems(Icons.fitness_center, "Sport Equipment", 0xff3399fe),
          ),
          GestureDetector(
            onTap: () {
              print("Electronic onTap called.");
            },
            child: myItems(Icons.usb, "Electronic ", 0xFF9575CD),
          ),
          GestureDetector(
            onTap: () {
              print("Books onTap called.");
            },
            child: myItems(Icons.book, "Books", 0xFF81C784),
          ),
          GestureDetector(
            onTap: () {
              print("Others onTap called.");
            },
            child: myItems(Icons.graphic_eq, "Others", 0xFFA1887F),
          )
        ],
        staggeredTiles: [
          StaggeredTile.extent(1, 150.0), //Stationaries
          StaggeredTile.extent(1, 150.0), //Clothes
          StaggeredTile.extent(1, 150.0), //Sportwares
          StaggeredTile.extent(1, 150.0), //Sport Equipment
          StaggeredTile.extent(1, 150.0), //Electronic
          StaggeredTile.extent(1, 150.0), //Books
          StaggeredTile.extent(1, 150.0), //Others
        ],
      ),
    );
  }
}
