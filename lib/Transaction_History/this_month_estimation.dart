import 'package:flutter/material.dart';

class ThisMonthEstimation extends StatefulWidget {
  @override
  _ThisMonthEstimationState createState() => _ThisMonthEstimationState();
}

class _ThisMonthEstimationState extends State<ThisMonthEstimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: IconButton(onPressed: null,icon: Icon(Icons.arrow_back_ios,color: Colors.white,),),
    title: Text('This Month Estimation'),
    ),
    );
  }
}
