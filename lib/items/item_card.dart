import 'package:flutter/material.dart';

import 'dart:io';
import 'package:intl/intl.dart';

import 'item_detail.dart';
import 'item_object.dart';

class ItemCard extends StatelessWidget {
//This class is for the itemcard widget
  ItemObject item;

  ItemCard(this.item);

  Widget _imageInBox(double width, double height, String imageurl, File file) {
    return file == null
        ? Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    imageurl,
                  ),
                  fit: BoxFit.fill),
            ),
          )
        : new Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(file),
                fit: BoxFit.cover,
              ),
            ),
            // child: Image.file(file),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Container(
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          leading: _imageInBox(100, 80, item.imageurl, item.examplepic),
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
              SizedBox(width: 10),
              Text("Pick Up: " + DateFormat("h:mma").format(item.pickupTime),
                  style: TextStyle())
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
          },
        ),
      ),
    );
  }
}
