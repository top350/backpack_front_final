import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front_backpack_app/api_provider.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:front_backpack_app/database/db_schema.dart';
import '../database/db_request.dart';
import '../database/db_account.dart';
import 'item_detail.dart';

class ItemCard extends StatelessWidget {
//This class is for the itemcard widget

  int requestNoPress = 0; // Send to Backend

  AccountObject user; //Recieve From Dashboard
  RequestObject itemRequest; //Recieve From Dashboard

  //ItemCard(this.itemRequest);
  ItemCard(
    this.user,
    this.itemRequest,
  );
  ApiProvider apiProvider = ApiProvider();

  UserObject account = new UserObject();
  Future<Null> doReqestitem() async {
    final rs = await apiProvider.doRequestitem(account.aid);
    print(rs.body);
    if (rs.statusCode == 200) {
      print(rs.body);
      var jsonRes = json.decode(rs.body);

      if (jsonRes['ok']) {
      } else {
        print('Server error');
      }
    }
  }

  Widget _imageInBox(double width, double height, String imageurl) {
    return 
         new Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.fill,
              ),
            ),
            // child: Image.file(file),
          );
  }

  @override
  Widget build(BuildContext context) {
    // String time = itemRequest.pickUpTime;
    // DateTime date = DateTime.parse(time);
    // String formattedDate = DateFormat('jm').format(date);
    return Card(
      elevation: 5.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Container(
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          leading: _imageInBox(
              100, 80, itemRequest.examplePicUrl,),
          title: Text(
            itemRequest.itemName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Icon(
                Icons.access_time,
                size: 10,
              ),
              SizedBox(width: 10),
              Text(itemRequest.pickUpTime, style: TextStyle(fontSize: 10))
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            iconSize: 40.0,
            onPressed: () {},
          ),
          onTap: () {
            // Send/Receive When pressed this
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetail(user, itemRequest),
              ),
            );
          },
        ),
      ),
    );
  }
}
