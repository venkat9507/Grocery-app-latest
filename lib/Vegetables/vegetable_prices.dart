import 'package:flutter/material.dart';

class VegetablePrices extends StatefulWidget {
  final name, imgUrl, description, price;
  VegetablePrices({this.name, this.description, this.imgUrl, this.price});
  @override
  _VegetablePricesState createState() => _VegetablePricesState();
}

class _VegetablePricesState extends State<VegetablePrices> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          ),
          title: Text('Product'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Image.network(
                    widget.imgUrl,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.name),
                            ),
                            Text(
                              '₹ ${widget.price.toString()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.03),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 60,
                          child: RaisedButton(
                            color: Colors.black,
                            onPressed: () {},
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.description),
                  ),
                  Container(
                    width: size.width,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
    );
  }
}
