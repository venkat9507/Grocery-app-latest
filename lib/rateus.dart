import 'package:flutter/material.dart';
import 'package:star_rating/star_rating.dart';

class RateUsPage extends StatefulWidget {
  @override
  _RateUsPageState createState() => _RateUsPageState();
}

class _RateUsPageState extends State<RateUsPage> {
  final int starLength = 5;
  double _rating = 0.0;
  // void _incrementHalfStar() {
  //   setState(() {
  //     _rating += 0.5;
  //     if (_rating > starLength) {
  //       _rating = starLength.toDouble();
  //     }
  //   });
  // }

  // void _decrementHalfStar() {
  //   setState(() {
  //     _rating -= 0.5;
  //     if (_rating < 0.0) {
  //       _rating = 0.0;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Rate Us',
          ),
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rate your experience",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, left: 14.0, right: 14.0),
                child: Text(
                  'Hello! Please give us your rating, your experience is an essential asset to us',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.black87),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, left: 14.0, right: 14.0),
                child: Text(
                  'Your feedback will help us imporve your personal experience and product experience',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              StarRating(
                color: Color(0xFF7653A3),
                mainAxisAlignment: MainAxisAlignment.start,
                length: starLength,
                rating: _rating,
                between: 5.0,
                starSize: 30.0,
                onRaitingTap: (rating) {
                  print('Clicked rating: $rating / $starLength');
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                width: 400.0,
                child: TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width,
                  child: FlatButton(
                    color: Color(0xFF7653A3),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Submit',
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
      ),
    );
  }
}
