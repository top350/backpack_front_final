import 'package:flutter/material.dart';

import 'itemlists.dart';
import 'item_card.dart';
import 'item_object.dart';

class ItemList extends StatelessWidget {
//This class is show all the itemlist in a certain category
String title;
List <ItemCard> itemlist ;

ItemList(this.title,this.itemlist);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(children:itemlist),
    );
  }
}

