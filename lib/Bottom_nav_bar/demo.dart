import 'dart:convert';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fthdaily/Vegetables/vegetables.dart';
import 'package:fthdaily/cart.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  List img = [
    'https://images.unsplash.com/photo-1488459716781-31db52582fe9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OHx8dmVnZXRhYmxlc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1571676906638-adf27a4985b3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
    'https://images.unsplash.com/photo-1562114808-b4b33cf60f4f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80',
    'https://images.unsplash.com/photo-1523473827533-2a64d0d36748?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=500&q=80'
  ];

  int _current = 0;
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.location_on),
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
          actions: [
            _shoppingCartBadge(),
          ],
        ),
        body: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/items.json'),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var data = json.decode(snapshot.data.toString());
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: size.height * 0.23,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Best Selling Categories',
                                  style: Theme.of(context).textTheme.headline5),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Vegetables()));
                                          },
                                          child: Container(
                                            decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: new Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                width: 4.0,
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.lightBlue[50],
                                              radius: 40.0,
                                              backgroundImage: NetworkImage(
                                                'https://images.unsplash.com/photo-1576186726115-4d51596775d1?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=401&q=80',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Dairy',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Vegetables()));
                                          },
                                          child: Container(
                                            decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: new Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                width: 4.0,
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.lightBlue[50],
                                              radius: 40.0,
                                              backgroundImage: NetworkImage(
                                                  'https://images.unsplash.com/photo-1581868164904-77b124b80242?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Curd',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Vegetables()));
                                          },
                                          child: Container(
                                            decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: new Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                width: 4.0,
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.lightBlue[50],
                                              radius: 40.0,
                                              backgroundImage: NetworkImage(
                                                  'https://images.unsplash.com/photo-1573246123716-6b1782bfc499?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=660&q=80'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Fruits',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Vegetables()));
                                          },
                                          child: Container(
                                            decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: new Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                width: 4.0,
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.lightBlue[50],
                                              radius: 40.0,
                                              backgroundImage: NetworkImage(
                                                  'https://images.unsplash.com/photo-1557844352-761f2565b576?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Vegetables',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Vegetables()));
                      },
                      child: Container(
                        height: size.height * 0.3,
                        child: Card(
                          child: CarouselSlider(
                            options: CarouselOptions(
                                autoPlay: true,
                                height: size.height * 0.3,
                                viewportFraction: 1.0,
                                enlargeCenterPage: false,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }),
                            items: img
                                .map((item) => Container(
                                      child: Center(
                                          child: Image.network(
                                        item,
                                        fit: BoxFit.fill,
                                        height: size.height * 0.26,
                                      )),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _shoppingCartBadge() {
    return Text('Cart');
    // return Badge(
    //   position: BadgePosition.topEnd(top: 0, end: 3),
    //   animationDuration: Duration(milliseconds: 300),
    //   animationType: BadgeAnimationType.scale,
    //   badgeContent: Text(
    //     _counter.toString(),
    //     style: TextStyle(color: Colors.white),
    //   ),
    //   child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => Cart()),
    //     );

    //   }),
    // );
  }
}
