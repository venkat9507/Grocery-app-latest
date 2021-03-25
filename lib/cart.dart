import 'package:flutter/material.dart';
import 'package:fthdaily/Bottom_nav_bar/store.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF7653A3)),
      home: Scaffold(
        body: Carts(),
      ),
    );
  }
}

class Carts extends StatefulWidget {
  @override
  _CartsState createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            actions: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('0 item(s) ₹0'),
              ))
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('assets/cart.png'),
              ),
              Text(
                'Your cart is empty',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Brows through the store and subscribe'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  color: Color(0xFF7653A3),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Go to Store',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Store()));
                  },
                ),
              ),
            ],
          ),
        ),
      );
  }
}
