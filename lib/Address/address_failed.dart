import 'package:flutter/material.dart';

class AddressFailed extends StatefulWidget {
  @override
  _AddressFailedState createState() => _AddressFailedState();
}

class _AddressFailedState extends State<AddressFailed> {
  @override
  Widget build(BuildContext context) {
   return Stack( // <-- STACK AS THE SCAFFOLD PARENT
        children: [
    Container(
    decoration: BoxDecoration(
    image: DecorationImage(
        image: AssetImage("images/fun.jpeg"), // <-- BACKGROUND IMAGE
    fit: BoxFit.cover,
    ),
    ),
    ),
     Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left_outlined,color: Colors.white,size: 35,), onPressed: null),
        actions: [
          IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: null),
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,), onPressed: null),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
             
            ],
          ),
        ),
      ),
    )]);
  }
}
