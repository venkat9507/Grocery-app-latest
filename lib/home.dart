// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:fthdaily/homepage.dart';
// import 'package:fthdaily/Bottom_nav_bar/wallet.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   // This widget is the root of your application.
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int currentTab = 0;

//   final List<Widget> screens = [Wallet()];

//   Widget currentScreen = HomePage();

//   final PageStorageBucket bucket = PageStorageBucket();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primaryColor: Color(0xFF7653A3)),
//       home: Scaffold(
//         body: PageStorage(bucket: bucket, child: currentScreen),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(
//             FontAwesomeIcons.store,
//             color: currentTab == 4 ? Color(0xFF7653A3) : Colors.grey,
//           ),
//           backgroundColor: Colors.white,
//           onPressed: () {
//             setState(() {
//               // currentScreen =DeliveryStatus();
//               currentTab = 4;
//             });
//           },
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: BottomAppBar(
//           shape: CircularNotchedRectangle(),
//           child: Container(
//             height: 60,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     MaterialButton(
//                       onPressed: () {
//                         setState(() {
//                           currentScreen = HomePage();
//                           currentTab = 0;
//                         });
//                       },
//                       minWidth: 40,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.store,
//                             color: currentTab == 0
//                                 ? Color(0xFF7653A3)
//                                 : Colors.grey,
//                           ),
//                           Text(
//                             'Store',
//                             style: TextStyle(
//                                 color: currentTab == 0
//                                     ? Color(0xFF7653A3)
//                                     : Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ),
//                     MaterialButton(
//                       onPressed: () {
//                         setState(() {
//                           currentScreen = Plans();
//                           currentTab = 1;
//                         });
//                       },
//                       minWidth: 40,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.event_note_outlined,
//                             color: currentTab == 1
//                                 ? Color(0xFF7653A3)
//                                 : Colors.grey,
//                           ),
//                           Text(
//                             'Plans',
//                             style: TextStyle(
//                                 color: currentTab == 1
//                                     ? Color(0xFF7653A3)
//                                     : Colors.grey),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     MaterialButton(
//                       onPressed: () {
//                         setState(() {
//                           currentScreen = Wallet();
//                           currentTab = 2;
//                         });
//                       },
//                       minWidth: 40,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.account_balance_wallet,
//                             color: currentTab == 2
//                                 ? Color(0xFF7653A3)
//                                 : Colors.grey,
//                           ),
//                           Text(
//                             'Wallet',
//                             style: TextStyle(
//                                 color: currentTab == 2
//                                     ? Color(0xFF7653A3)
//                                     : Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ),
//                     MaterialButton(
//                       onPressed: () {
//                         setState(() {
//                           currentScreen = Account();
//                           currentTab = 3;
//                         });
//                       },
//                       minWidth: 40,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.supervisor_account_outlined,
//                             color: currentTab == 3
//                                 ? Color(0xFF7653A3)
//                                 : Colors.grey,
//                           ),
//                           Text(
//                             'Account',
//                             style: TextStyle(
//                                 color: currentTab == 3
//                                     ? Color(0xFF7653A3)
//                                     : Colors.grey),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
