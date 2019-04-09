import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electronic'),
      ),
      body: ListView(
        children: <Widget>[ItemCard(), ItemCard()],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Container(
          child: LisTile(),
        ));
  }
}

class LisTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        leading: Container(
            width: 100,
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/laptop.jpg',
                  ),
                  fit: BoxFit.fill),
            )),
        title: Text(
          "Laptop",
          style: TextStyle(fontWeight: FontWeight.bold,),
        ),
        subtitle: Row(
          children: <Widget>[
            Icon(
              Icons.access_time,
              size: 20,
            ),
            Text("Pick Up:12 AM", style: TextStyle())
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.keyboard_arrow_right),
          iconSize: 40.0,
          onPressed: () {
            print('IconPressed');
            Navigator.pushNamed(context, "/item_detail");
          },
        ));
  }
}
