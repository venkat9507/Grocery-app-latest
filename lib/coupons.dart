import 'package:flutter/material.dart';

class CouponsPage extends StatefulWidget {
  @override
  _CouponsPageState createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController coupon;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Coupons'),
          automaticallyImplyLeading: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.25,
              color: Color(0xFFF1ECF8),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Enter Coupon Code',
                        style: TextStyle(
                            color: Color(0xFF7653A3),
                            fontSize: size.height * 0.03),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    width: size.width * 0.5,
                    child: TextFormField(
                      controller: coupon,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Enter Coupon Code',
                        hintStyle: TextStyle(
                          color: Color(0xFF7653A3),
                        ),
                      ),
                      style: TextStyle(
                        color: Color(0xFF7653A3),
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xFFE6E6E6),
              height: size.height * 0.09,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 12.0),
                child: Text(
                  'Coupons History',
                  style: TextStyle(
                      fontSize: size.height * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: size.width,
                child: FlatButton(
                  color: Color(0xFF9B63DC),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Apply Coupon',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
