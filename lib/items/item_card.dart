import 'package:flutter/material.dart';

import 'item_detail.dart';
import 'item_object.dart';


class ItemCard extends StatelessWidget {
//This class is for the itemcard widget
  ItemObject item;

  ItemCard (this.item);

  // String title;
  // String time;
  // String imageurl;

  // ItemCard(this.title, this.time, this.imageurl);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Container(
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            leading: Container(
                width: 100,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        item.imageurl,
                      ),
                      fit: BoxFit.fill),
                )),
            title: Text(
              item.itemName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: <Widget>[
                Icon(
                  Icons.access_time,
                  size: 20,
                ),
                Text("Pick Up: " + item.pickupTime, style: TextStyle())
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              iconSize: 40.0,
              onPressed: () {},
            ),
            onTap: () {
              print('IconPressed');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetail(item),
                ),
              );
              // Navigator.pushNamed(context, "/item_detail");
            },
          ),
        ));
  }
}
