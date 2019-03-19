import 'package:flutter/material.dart';
import 'display.dart';
class Home extends StatefulWidget{
  State<StatefulWidget> createState()=> HomeState();
}
class HomeState extends State<Home>{
  int currentindex=0;
  final List<Widget> _children =[
    DisplayWidget(Colors.pink),
    DisplayWidget(Colors.red),
    DisplayWidget(Colors.green),
    DisplayWidget(Colors.blue),
  ];
  Widget build(BuildContext context){
    return Scaffold(
        //  appBar: AppBar(
        //    title: Text('BottomBar'),
        //  ),
        body: _children[currentindex],
        
         bottomNavigationBar: BottomNavigationBar(
           currentIndex: currentindex,
           onTap:onTabTapped,
           fixedColor: Colors.pink[200],
           type: BottomNavigationBarType.fixed,
           items: <BottomNavigationBarItem>[
             BottomNavigationBarItem(
               icon: Icon(Icons.home),
               title: Text('Home'),
             ),
               BottomNavigationBarItem(
               icon: Icon(Icons.create),
               title: Text('Lent'),
             ),
               BottomNavigationBarItem(
               icon: Icon(Icons.history),
               title: Text('session'),
             ),
               BottomNavigationBarItem(
               icon: Icon(Icons.face),
               title:Text('Profile'),
             ),
           ]
             ),
         
         );
    
  }
  void onTabTapped(int index){
    setState(() {
     currentindex =index; 
    });
  }
}