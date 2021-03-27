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
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
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
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
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
                                                shape: BoxShape.rectangle,
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
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
                                                shape: BoxShape.rectangle,
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
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
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/reference_guide/vegetarian_and_vegan_diets_explained_ref_guide/650x350_vegetarian_and_vegan_diets_explained_ref_guide.jpg',width: 70,height: 70 ,),
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
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
                                              ),
                                              child: Card(
                                                child: Image.network('https://www.simplyrecipes.com/thmb/Rczw1GPTdhmx0e9d9jvzLn8YPLg=/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2014__07__hard-boiled-eggs-horiz-800-429f7e9948b84a6d84237e228f9d54f2.jpg',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Eggs',
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
                                                shape: BoxShape.rectangle,
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://as1.ftcdn.net/jpg/01/21/53/52/500_F_121535223_vrnNvV7g7yeYZPrquCJtmck8XCxyiqFU.jpg',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Cut Vegetables',
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
                                                shape: BoxShape.rectangle,
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://boobay.in/uploads/products/160612127131.jpg',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Bun',
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
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/reference_guide/living_with_a_milk_allergy_ref_guide/650x350_living_with_a_milk_allergy_ref_guide.jpg?resize=*:350px',width: 70,height: 70 ,),
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
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
                                              ),
                                              child: Card(
                                                child: Image.network('https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/foodnavigator-asia.com/headlines/policy/wary-of-dairy-taiwan-steps-up-regulations-for-all-milk-and-related-product-imports/10728999-1-eng-GB/Wary-of-dairy-Taiwan-steps-up-regulations-for-all-milk-and-related-product-imports_wrbm_large.jpg',width: 70,height: 70,),
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
                                                shape: BoxShape.rectangle,
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://d1z88p83zuviay.cloudfront.net/ProductVariantThumbnailImages/3abc9dec-59b6-445e-8ad7-eacc5fd80b1f_425x425.jpg',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Bread',
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
                                                shape: BoxShape.rectangle,
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://www.indianhealthyrecipes.com/wp-content/uploads/2018/09/how-to-make-curd-006.jpg',width: 70,height: 70,),
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
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/foodnavigator-asia.com/article/2019/05/15/delay-debacle-fssai-postpones-enforcement-of-wheat-flour-labelling-regulations-its-fifth-hold-up-this-year/9458228-1-eng-GB/Delay-debacle-FSSAI-postpones-enforcement-of-wheat-flour-labelling-regulations-its-fifth-hold-up-this-year.jpg',width: 70,height: 70 ,),
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
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
                                              ),
                                              child: Card(
                                                child: Image.network('https://blogs.medibuddy.in/wp-content/uploads/2019/04/maida_blog-image-01.jpg',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Maida',
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
                                                shape: BoxShape.rectangle,
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
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
                                                shape: BoxShape.rectangle,
                                                border: new Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 4.0,
                                                ),
                                              ),
                                              child: Card(
                                                child: Image.network(
                                                  'https://www.davidlebovitz.com/wp-content/uploads/2019/10/Multigrain-biscotti-recipe-3-1-640x899.jpg',width: 70,height: 70,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Multi-Grain',
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
