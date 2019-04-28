// import 'package:flutter/material.dart';

// import 'kiosk_session.dart';
// import '../database/db_account.dart';

// class WaitingSession extends StatelessWidget {
//   //Session1

//   AccountObject currentUser; //Receive from Home
//   // WaitingSession(this.currentUser);

//   // AccountObject otherPerson = user2; //Receive from Backend if in session
//   // int sessionID = 0; //Receive from Backend if in session
//   // String notInSession = ''; //Receive from Backend if not in session

//   @override
//   Widget build(BuildContext context) {
//     //String accountstuID = currentUser.studentID; //Send to Backend

//     double screenSizeHeight = MediaQuery.of(context).size.height;
//     double screenSizeWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Waiting Session'),
//         // actions: <Widget>[
//         //   //For Testing Only
//         //   IconButton(
//         //     icon: Icon(
//         //       Icons.navigate_next,
//         //     ),
//         //     onPressed: () {
//         //       Navigator.of(context).push(
//         //         MaterialPageRoute(builder: (context) => new KioskSession(currentUser,sessionID,otherPerson)),
//         //       );
//         //     },
//         //   )
//         // ],
//       ),
//       body: Center(
//         //child: GestureDetector(
//           //onTap: () {
//             //Send/Receive when this is press
//             //if in session pusj to KioskSession , if not stay at samepage
//             // Navigator.of(context).push(
//             //   MaterialPageRoute(
//             //       builder: (context) =>
//             //           new KioskSession(currentUser, sessionID, otherPerson)),
//             // );
//          // },
//           child: Icon(
//             Icons.refresh,
//             size: screenSizeWidth / 1.5,
//             color: Colors.pink[200],
//           ),
//         ),
//  //     ),
//     );
//   }
// }
