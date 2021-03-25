import 'package:flutter/material.dart';
import 'package:fthdaily/cart.dart';
import 'package:fthdaily/main.dart';
import 'package:badges/badges.dart';
class Plans extends StatefulWidget {
  @override
  _PlansState createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF7653A3)),
      home: Scaffold(
        appBar: AppBar(
          title: FlatButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Address',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Colors.white,
                  size: 30,
                )
              ],
            ),
          ),
          leading: Icon(Icons.location_on),
          actions: [
            _shoppingCartBadge()
          ],
        ),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 72,
            ),
            Center(
              child: Image(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.9,
                  image: AssetImage('images/plans.png')),
            ),
            Text(
              'You have no subscriptions',
              style: TextStyle(
                  color: Color(0xFF7653A3),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              'Browse through the store and subscribe',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Container(
              height: 42,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade300),
              child: FlatButton(
                  hoverColor: Colors.black,
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    });
                  },
                  child: Text('Go To Store',
                      style: TextStyle(color: Color(0xFF7653A3)))),
            ),
          ],
        )),
      ),
    );
  }


  Widget _shoppingCartBadge() {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.scale,
      badgeContent: Text(
        _counter.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Cart()),
        );

      }),
    );
  }


}


