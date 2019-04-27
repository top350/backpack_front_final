import 'package:flutter/material.dart';

import 'item_card.dart';
import '../database/db_account.dart';

class ItemList extends StatelessWidget {
//This class is show all the itemlist in a certain category
String requestNo; //Send to Backend when pressed on card

AccountObject borrower; //From Backend when pressed on card

final String title;
final List <ItemCard> itemlist ;

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

