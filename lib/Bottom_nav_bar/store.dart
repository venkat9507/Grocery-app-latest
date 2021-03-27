import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fthdaily/Vegetables/vegetables.dart';
import 'package:fthdaily/cart.dart';
import 'package:fthdaily/grocery-store/Grocery_Store_home.dart';
import 'package:fthdaily/grocery-store/cart%20demo.dart';

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
                return ListView(
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
                                            onTap: (){
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  transitionDuration: Duration(seconds: 1),
                                                  pageBuilder: (context, animation, __) {
                                                    return FadeTransition(
                                                        opacity: animation,
                                                        child:GroceryStoreHome(),);
                                                  },
                                                ),
                                              );

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
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
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
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
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
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
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
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Vegetables()));
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
                    ),
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
                                child: Text('OFFERS',
                                    style: Theme.of(context).textTheme.headline5),
                              ),
                              Padding(padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Top Savings',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
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
                                            onTap: (){
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  transitionDuration: Duration(seconds: 1),
                                                  pageBuilder: (context, animation, __) {
                                                    return FadeTransition(
                                                      opacity: animation,
                                                      child:GroceryStoreHome(),);
                                                  },
                                                ),
                                              );

                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                              child: Image.network(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_cyRyM-OzBJX17cRqv9dWj8ZJ5SewaI16Vw&usqp=CAU',width: 70,height: 70 ,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Mixed fruits',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '\$',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        // Text(
                                        // "",
                                        //   style: Theme.of(context)
                                        //       .textTheme
                                        //       .subtitle1,
                                        // ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYEa9rbzAZqK-S0hWz70KKMM7kI8xjLZ9QKbEj-f52A7FQobQjg-hZc1o4vLbWKKgK5Wc&usqp=CAU',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Peach',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '\$',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                               child: Image.network(
                                                    'https://www.eatrightbasket.com/wp-content/uploads/2019/04/pineapple-500x500.jpg',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Pineapple',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '\$',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                               child: Image.network(
                                                    'https://img1.exportersindia.com/product_images/bc-full/dir_184/5514102/organic-fruits-1518077327-3634362.jpg',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Organic-fruits',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '\$',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
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
                      child: Container(
                        height: size.height * 0.23,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('New Arrivals',
                                    style: Theme.of(context).textTheme.headline5),
                              ),
                              // Padding(padding: const EdgeInsets.only(left: 8.0),
                              //   child: Text('Top Savings',
                              //     style: Theme.of(context).textTheme.subtitle1,
                              //   ),
                              // ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  transitionDuration: Duration(seconds: 1),
                                                  pageBuilder: (context, animation, __) {
                                                    return FadeTransition(
                                                      opacity: animation,
                                                      child:GroceryStoreHome(),);
                                                  },
                                                ),
                                              );

                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-pM2cVm5aP1LOpQmwK2y41Ohv81XUmeds5g&usqp=CAU',width: 70,height: 70 ,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Vegetable',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '₹88',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        // Text(
                                        // "",
                                        //   style: Theme.of(context)
                                        //       .textTheme
                                        //       .subtitle1,
                                        // ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4KiuJnxCGQi8_vD0AeGfuIAsMiBABqS6ya63Fpx95VUkCDhGsYa2rCFAH8qW04m7I01Y&usqp=CAU',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Eggs',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '₹15',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxWkANIZuMyBRylocbkjqQchVAsvD7-zqnlQ&usqp=CAU',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Cut Vegetables',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '₹95',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmRdeFoTi6cra8p2Axbvmfv8tiszfMe9tTBg&usqp=CAU',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Bun',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '₹15',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
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
                      child: Container(
                        height: size.height * 0.23,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Festival Specials',
                                    style: Theme.of(context).textTheme.headline5),
                              ),
                              // Padding(padding: const EdgeInsets.only(left: 8.0),
                              //   child: Text('Top Savings',
                              //     style: Theme.of(context).textTheme.subtitle1,
                              //   ),
                              // ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  transitionDuration: Duration(seconds: 1),
                                                  pageBuilder: (context, animation, __) {
                                                    return FadeTransition(
                                                      opacity: animation,
                                                      child:GroceryStoreHome(),);
                                                  },
                                                ),
                                              );

                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROvHPCLYSA46d067U07-5phMhTBIrJnwHKdw&usqp=CAU',width: 70,height: 70 ,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Milk',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '₹55',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        // Text(
                                        // "",
                                        //   style: Theme.of(context)
                                        //       .textTheme
                                        //       .subtitle1,
                                        // ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSESj9QZV2nqFqcsbVcdJ_4MtFHlPl6dVGb1Q&usqp=CAU',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Dairy',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '₹63',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4Lxmbe3PIzwVYmOxDLjyArJQ-1lNn1M6FFQ&usqp=CAU',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Bread',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '₹25',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFf2DjUked4bb3IuVFailuKsMq2uhUy1wVeg&usqp=CAU',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Curd',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '₹19',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
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
                      child: Container(
                        height: size.height * 0.23,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Immunity Boosters',
                                    style: Theme.of(context).textTheme.headline5),
                              ),
                              // Padding(padding: const EdgeInsets.only(left: 8.0),
                              //   child: Text('Top Savings',
                              //     style: Theme.of(context).textTheme.subtitle1,
                              //   ),
                              // ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  transitionDuration: Duration(seconds: 1),
                                                  pageBuilder: (context, animation, __) {
                                                    return FadeTransition(
                                                      opacity: animation,
                                                      child:GroceryStoreHome(),);
                                                  },
                                                ),
                                              );

                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvYg7MmLZ98Ek8SbNS0Q-O2twJMgiBinXrSw&usqp=CAU',width: 70,height: 70 ,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Wheat',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '₹44',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        // Text(
                                        // "",
                                        //   style: Theme.of(context)
                                        //       .textTheme
                                        //       .subtitle1,
                                        // ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTNfVdSTc54K4oonq6hSXAXGETEP5GG4xRRw&usqp=CAU',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Maida',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '₹24',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://www.eatrightbasket.com/wp-content/uploads/2019/03/Wheat-Flour.jpg',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Flour',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '₹18',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVDJX2Mw3iLzXeoX-BtHy4qk0QYKhV3eOfYA&usqp=CAU',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Multi-Grain',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '₹56',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
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
                      child: Container(
                        height: size.height * 0.40,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Categories',
                                    style: Theme.of(context).textTheme.headline5),
                              ),
                              // Padding(padding: const EdgeInsets.only(left: 8.0),
                              //   child: Text('Top Savings',
                              //     style: Theme.of(context).textTheme.subtitle1,
                              //   ),
                              // ),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  transitionDuration: Duration(seconds: 1),
                                                  pageBuilder: (context, animation, __) {
                                                    return FadeTransition(
                                                      opacity: animation,
                                                      child:GroceryStoreHome(),);
                                                  },
                                                ),
                                              );

                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://img.freepik.com/free-photo/composition-with-chilli-pepper-powder-spice-garlic-sauce-gray-wall_185193-853.jpg?size=626&ext=jpg',width: 160,height: 160 ,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Sauce & Spices',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
                                            },
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // border: new Border.all(
                                                //   color: Theme.of(context)
                                                //       .primaryColor,
                                                //   width: 4.0,
                                                // ),
                                              ),
                                              child: Card(
                                                child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTNfVdSTc54K4oonq6hSXAXGETEP5GG4xRRw&usqp=CAU',width: 160,height: 160,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Farm Fresh Vegetables',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),

                                  ],
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: size.height * 0.23,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Text('Best Selling Categories',
                              //       style: Theme.of(context).textTheme.headline5),
                              // ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  transitionDuration: Duration(seconds: 1),
                                                  pageBuilder: (context, animation, __) {
                                                    return FadeTransition(
                                                      opacity: animation,
                                                      child:GroceryStoreHome(),);
                                                  },
                                                ),
                                              );

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
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
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
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
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
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Vegetables()));
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
                  ],
                );
              }
            },
          ),
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
          MaterialPageRoute(builder: (context) => GroceryStoreCartDemo(
            data: [],
          ),),
        );

      }),
    );
  }
}
