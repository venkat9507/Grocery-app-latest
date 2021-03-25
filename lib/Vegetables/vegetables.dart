import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../Bottom_nav_bar/store.dart';
import 'vegetable_prices.dart';
import 'package:fthdaily/cart.dart';
class Vegetables extends StatefulWidget {
  @override
  _VegetablesState createState() => _VegetablesState();
}

class _VegetablesState extends State<Vegetables> {
  @override
  Widget build(BuildContext context) {
    return  vegetables();
  }
}


class vegetables extends StatefulWidget {

  @override
  _vegetablesState createState() => _vegetablesState();
}

class _vegetablesState extends State<vegetables> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text('Vegetables'),
            actions: [
              IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.search),
              ),
              _shoppingCartBadge(),
            ],
          ),
          body: FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
              builder: (context,snapshot){
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else
                {
                  var data = json.decode(snapshot.data.toString());
                  return  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.grey.shade400,
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('All'),
                              Text('Orinko'),
                              Text('Vegetables'),

                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: size.height*0.3,
                            child: ListView.builder(
                              itemCount: data.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) =>
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => VegetablePrices(
                                            imgUrl: data[index]['imgUrl'],
                                            name: data[index]['name'],
                                            price: data[index]['price'],
                                            description: data[index]['description'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      margin: EdgeInsets.all(4),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.network(data[index]['imgUrl'],
                                              fit: BoxFit.scaleDown,
                                              height: size.width * 0.3),
                                          new Text(data[index]['name']),
                                          Text(data[index]['price'].toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: size.height*0.3,
                            child: ListView.builder(
                              itemCount: data.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) =>
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => VegetablePrices(
                                            imgUrl: data[index]['imgUrl'],
                                            name: data[index]['name'],
                                            price: data[index]['price'],
                                            description: data[index]['description'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      margin: EdgeInsets.all(4),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.network(data[index]['imgUrl'],
                                              fit: BoxFit.scaleDown,
                                              height: size.width * 0.3),
                                          new Text(data[index]['name']),
                                          Text(data[index]['price'].toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: size.height*0.3,
                            child: ListView.builder(
                              itemCount: data.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) =>
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => VegetablePrices(
                                            imgUrl: data[index]['imgUrl'],
                                            name: data[index]['name'],
                                            price: data[index]['price'],
                                            description: data[index]['description'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      margin: EdgeInsets.all(4),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.network(data[index]['imgUrl'],
                                              fit: BoxFit.scaleDown,
                                              height: size.width * 0.3),
                                          new Text(data[index]['name']),
                                          Text(data[index]['price'].toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          child: Container(
                            height: size.height*1,
                            child: ListView.builder(
                              itemCount: data.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) =>
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => VegetablePrices(
                                            imgUrl: data[index]['imgUrl'],
                                            name: data[index]['name'],
                                            price: data[index]['price'],
                                            description: data[index]['description'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      elevation: 5,
                                      margin: EdgeInsets.all(4),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.network(data[index]['imgUrl'],
                                                fit: BoxFit.scaleDown,
                                                height: size.width * 0.3),
                                          ),
                                          Column(
                                            children: [
                                              new Text(data[index]['name'],style: TextStyle(color: Theme.of(context).primaryColor),),
                                              SizedBox(
                                                height: 60,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset('images/rupee-indian.png',height: size.height*0.02,),
                                                  Text(data[index]['price'].toString()),
                                                ],
                                              )
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Card(
                                                elevation: 5,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text('Get Once',style: TextStyle(color: Theme.of(context).primaryColor,)),
                                                ),
                                              ),
                                              Card(
                                                elevation: 5,
                                                color: Theme.of(context).primaryColor,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text('Subscribe',style: TextStyle(color: Colors.white)),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }
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
          MaterialPageRoute(builder: (context) => Cart()),
        );

      }),
    );
  }


}
