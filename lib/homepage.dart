import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class  Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
  
}
class  _DashboardState extends State<Dashboard>{
  Material myItems(IconData icon,String heading,int color){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child:Center(
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
                    child:Text(heading,
                  style: TextStyle(
                    color: new Color(color),
                    fontSize: 20.0
                 ) ,
                    ),
                 ),
                 Material(
                   color:new Color(color),
                   borderRadius:BorderRadius.circular(24.0),
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child:Icon(icon,
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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Category',
        style :TextStyle(
          color:Colors.white,
          
        )
        ),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2 ,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 35.0,),
        
        children: <Widget>[
          myItems(Icons.edit,"Stationaries",0xffed622b),
          myItems(Icons.wc,"Clothes",0xff26cb3c),
          myItems(Icons.directions_bike,"Sportwares",0xffff3266),
          myItems(Icons.fitness_center,"Sport Equip.",0xff3399fe),
          myItems(Icons.laptop,"Laptop",0xfff4c83f),
          myItems(Icons.camera_alt,"Camera",0xff622F74),
          myItems(Icons.tablet,"Tablets",0xff7297ff),
          myItems(Icons.usb,"Electronic ",0xFF9575CD),
          myItems(Icons.book,"Books",0xFF81C784),
          myItems(Icons.graphic_eq,"Others",0xFFA1887F),
        ],
        staggeredTiles: [
        StaggeredTile.extent(1,150.0),
        StaggeredTile.extent(1,150.0),
        StaggeredTile.extent(1,150.0),
        StaggeredTile.extent(1,150.0),
        StaggeredTile.extent(1,150.0),
        StaggeredTile.extent(1,150.0),
        StaggeredTile.extent(1,150.0),
        StaggeredTile.extent(1,150.0),
        StaggeredTile.extent(1,150.0),
         StaggeredTile.extent(1,150.0),
          StaggeredTile.extent(1,150.0),

        ],
      ),
    );
  }
}