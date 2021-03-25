import 'package:flutter/material.dart';

class LastMonth extends StatefulWidget {
  @override
  _LastMonthState createState() => _LastMonthState();
}

class _LastMonthState extends State<LastMonth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: null,icon: Icon(Icons.arrow_back_ios,color: Colors.white,),),
        title: Text('Last Month '),
      ),
    );
  }
}
