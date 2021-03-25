import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fthdaily/cart.dart';
import 'package:fthdaily/grocery-store/cart%20demo.dart';

class Stores extends StatefulWidget {
  @override
  _StoresState createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF7653A3)),
      home: SafeArea(child: Scaffold(
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
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Diary').snapshots(),
            builder:  ( context,  snapshot){
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: makeListWiget(snapshot),
              );
            }),
      )),
    );
  }
  List<Widget> makeListWiget(AsyncSnapshot snapshot) {
    return snapshot.data.documents.map<Widget>((document) {
      if(snapshot!= null){
       return  ListView(
         scrollDirection: Axis.vertical,
         shrinkWrap: true,
         padding: const EdgeInsets.all(8.0),
         itemExtent: 106.0,
         children: <CustomListItem>[
           CustomListItem(
             user: document.get('price').toString(),
             viewCount: document.get('quantity').toString(),
             thumbnail: InkWell(
               onTap: (){
                 Navigator.push(context,MaterialPageRoute(
                   builder: (context) => ProductDetail(
                     imgUrl: document.get('photo_url'),
                     name: document.get('name'),
                     price: document.get('price').toString(),
                     description: document.get('description'),
                   ),
                 ),
                 );
               },
               child: Container(
                 height: 60,
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
                     child: Image.network(document.get('photo_url'), )),
               ),
             ),
             title: document.get('name'),

           ),
         ],
       );
      }
      else
        {
          EasyLoading.init();
        }
      //   ListTile(
      //   leading: Container(
      //     decoration: new BoxDecoration(
      //       shape: BoxShape.circle,
      //       border: new Border.all(
      //         color: Theme.of(context)
      //             .primaryColor,
      //         width: 4.0,
      //       ),
      //     ),
      //     child: CircleAvatar(
      //         child: Image.network(document.get('photo_url'))),
      //   ),
      //   title: Text('data'),
      //   trailing: Text(document.get('name')),
      //
      // );
    }).toList();
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
          MaterialPageRoute(builder: (context) => GroceryStoreCartDemo(data: [],),),
        );

      }),
    );
  }
}


/// Flutter code sample for ListTile

// Here is an example of a custom list item that resembles a Youtube related
// video list item created with [Expanded] and [Container] widgets.
//
// ![Custom list item a](https://flutter.github.io/assets-for-api-docs/assets/widgets/custom_list_item_a.png)



class CustomListItem extends StatefulWidget {

  const CustomListItem({
    this.thumbnail,
    this.title,
    this.user,
    this.viewCount,
    this.divider,
  });

  final Widget thumbnail;
  final String title;
  final String user;
  final String viewCount;
  final Widget divider;

  @override
  _CustomListItemState createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  bool isSelectedGetOnce =false;
  bool isSelectedSubscribe =false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: widget.thumbnail,
                ),
                Expanded(
                  flex: 3,
                  child: _VideoDescription(
                    title: widget.title,
                    user: widget.user,
                    viewCount: widget.viewCount,
                  ),
                ),
                Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                       setState(() {
                         print('done');
                         isSelectedGetOnce = !isSelectedGetOnce;
                       });
                      },
                      child: Container(
                        decoration: new BoxDecoration(
                            border: Border.all(color: Theme.of(context).primaryColor),
                            color: isSelectedGetOnce == true ? Theme.of(context).primaryColor : Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
                            borderRadius: new BorderRadius.all(Radius.circular(16))
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Get Once',
                            style: TextStyle(
                                color: isSelectedGetOnce == true ? Colors.white : Theme.of(context).primaryColor, //new Color.fromRGBO(255, 0, 0, 0.0),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ), MaterialButton(
                      onPressed: () {
                        setState(() {
                          print('done');
                          isSelectedSubscribe = ! isSelectedSubscribe;
                        });
                      },
                      child: Container(
                        decoration: new BoxDecoration(
                            border: Border.all(color: Theme.of(context).primaryColor),
                            color: isSelectedSubscribe == true ? Colors.white : Theme.of(context).primaryColor, //new Color.fromRGBO(255, 0, 0, 0.0),
                            borderRadius: new BorderRadius.all(Radius.circular(16))
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Subscribe',
                            style: TextStyle(
                                color: isSelectedSubscribe == true ? Theme.of(context).primaryColor: Colors.white , //new Color.fromRGBO(255, 0, 0, 0.0),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
            Divider(
              color: Colors.black,
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 0,
            ),
          ],
        ),
      ],
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    Key key,
    this.title,
    this.user,
    this.viewCount,
  }) : super(key: key);

  final String title;
  final String user;
  final String viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,color: Theme.of(context).primaryColor,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),


          Row(
            children: [
              Container(
                  decoration: new BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),//new Color.fromRGBO(255, 0, 0, 0.0),
                      borderRadius: new BorderRadius.all(Radius.circular(8))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Qty',style: TextStyle(color: Theme.of(context).primaryColor),)
                  )),
              Text(
                ' = $viewCount ',
                style:  TextStyle(fontSize: 14.0,color: Theme.of(context).primaryColor)),

            ],
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Text(
              ' ₹ $user',
              style:  TextStyle(fontSize: 18.0,color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}


class ProductDetail extends StatefulWidget {
   final name, imgUrl, description, price;
   ProductDetail({this.name,this.description,this.imgUrl,this.price});
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isSelectedGetOnce =false;
  bool isSelectedSubscribe =false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF7653A3)),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.name),
            leading: IconButton(icon:Icon(Icons.arrow_back_ios,
            ),
            onPressed: (){
              Navigator.pop(context);
            },),
          ),
          body: Column(
            children: [
              Image.network(widget.imgUrl,
                width: MediaQuery.of(context).size.width,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.name,
                            style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                              color: Color(0xFF7653A3),
                          ),),
                        ),
                        Text(
                            '₹ ${widget.price.toString()}',
                            style:  TextStyle(fontSize: 18.0,color: Color(0xFF7653A3),fontWeight: FontWeight.bold)
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              print('done');
                              isSelectedGetOnce = !isSelectedGetOnce;
                            });
                          },
                          child: Container(
                            decoration: new BoxDecoration(
                                border: Border.all(color: Theme.of(context).primaryColor),
                                color: isSelectedGetOnce == true ? Theme.of(context).primaryColor : Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
                                borderRadius: new BorderRadius.all(Radius.circular(16))
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Get Once',
                                style: TextStyle(
                                    color: isSelectedGetOnce == true ? Colors.white : Theme.of(context).primaryColor, //new Color.fromRGBO(255, 0, 0, 0.0),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ), MaterialButton(
                          onPressed: () {
                            setState(() {
                              print('done');
                              isSelectedSubscribe = ! isSelectedSubscribe;
                            });
                          },
                          child: Container(
                            decoration: new BoxDecoration(
                                border: Border.all(color: Theme.of(context).primaryColor),
                                color: isSelectedSubscribe == true ? Colors.white : Theme.of(context).primaryColor, //new Color.fromRGBO(255, 0, 0, 0.0),
                                borderRadius: new BorderRadius.all(Radius.circular(16))
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Subscribe',
                                style: TextStyle(
                                    color: isSelectedSubscribe == true ? Theme.of(context).primaryColor: Colors.white , //new Color.fromRGBO(255, 0, 0, 0.0),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.description,style: TextStyle(fontSize: 15,color: Color(0xFF7653A3)),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
