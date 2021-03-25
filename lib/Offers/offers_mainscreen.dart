import 'package:flutter/material.dart';
import 'package:fthdaily/Offers/Offers.dart';
import 'package:badges/badges.dart';
class OffersMainScreen extends StatefulWidget {
  @override
  _OffersMainScreenState createState() => _OffersMainScreenState();
}

class _OffersMainScreenState extends State<OffersMainScreen> {
  int currentTab = 0;
  Widget currentScreen = Offers();
  final PageStorageBucket bucket = PageStorageBucket();
  final List<Widget> screens = [
    Offers(),
    ActivatedOffers(),

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF7653A3),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.arrow_back_ios),
                onPressed: (){
                  Navigator.pop(context);
                },),
              title: Text("Offers"),
              bottom: _tabBar(),
            ),
            body: TabBarView(children: [
              Offers(),
              ActivatedOffers(),
            ])
        ),
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(tabs: [
      Tab(
        icon: Badge(
          badgeColor: Colors.green,
          badgeContent: Text(
            '0',
            style: TextStyle(color: Colors.white),
          ),
          child: Text(
            'Offers',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      Tab(
        icon: Badge(

          badgeColor: Colors.red,
          shape: BadgeShape.square,
          borderRadius: BorderRadius.circular(5),
          position: BadgePosition.topEnd(top: -12, end: -20),
          padding: EdgeInsets.all(2),
          badgeContent: Text(
            '0',
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          child: Text(
            'Activated Offers',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ]);
  }
}
