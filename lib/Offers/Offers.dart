import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF7653A3)),
      home: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Center(
              child: Image(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.9,
                  image: AssetImage('images/no offer.png')),
            ),
          ],
        )),
      ),
    );
  }
}

class ActivatedOffers extends StatefulWidget {
  @override
  _ActivatedOffersState createState() => _ActivatedOffersState();
}

class _ActivatedOffersState extends State<ActivatedOffers> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Center(
                child: Text(
              'No Activated Offers',
              style: TextStyle(fontSize: 30),
            ))
          ],
        )),
      ),
    );
  }
}
