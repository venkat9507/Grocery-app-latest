import 'package:flutter/material.dart';
import 'package:fthdaily/grocery-store/cart%20demo.dart';
import 'package:fthdaily/grocery-store/grocery_provider.dart';
import 'package:fthdaily/grocery-store/grocery_store_bloc.dart';
import 'package:fthdaily/grocery-store/grocery_store_cart.dart';
import 'package:fthdaily/grocery-store/grocery_store_list.dart';
import 'package:fthdaily/razorpay/razorpay.dart';
//import 'package:shared_preferences/shared_preferences.dart';



const backgroundColor = Color(0xFFF6F5F2);
const cartBarHeight = 120.0;
const _panelTransition = Duration(milliseconds: 500);

class GroceryStoreHome extends StatefulWidget {
  @override
  _GroceryStoreHomeState createState() => _GroceryStoreHomeState();
}

class _GroceryStoreHomeState extends State<GroceryStoreHome> {


  final bloc = GroceryStoreBloc();
  void _onVerticalGesture(DragUpdateDetails details) {
    print(details.primaryDelta);
    if (details.primaryDelta < -7) {
      bloc.changeToCart();
    } else if (details.primaryDelta > 12) {
      bloc.changeToNormal();
    }
  }

  void cartIcon(GroceryState state){
    bloc.changeToCart();
  }


  double _getTopForWhitePanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return -cartBarHeight + kToolbarHeight;
    } else if (state == GroceryState.cart) {
      return -(size.height - kToolbarHeight - cartBarHeight / 2);
    }
    return 0.0;
  }

  double _getTopForBlackPanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return size.height - cartBarHeight;
    } else if (state == GroceryState.cart) {
      return cartBarHeight / 2;
    }
    return 0.0;
  }

  double _getTopForAppBar(
    GroceryState state,
  ) {
    if (state == GroceryState.normal) {
      return 0.0;
    } else if (state == GroceryState.cart) {
      return -cartBarHeight;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GroceryProvider(
      bloc: bloc,
      child: AnimatedBuilder(
          animation: bloc,
          builder: (context, _) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      curve: Curves.decelerate,
                      duration: _panelTransition,
                      left: 0,
                      right: 0,
                      top: _getTopForWhitePanel(bloc.groceryState, size),
                      height: size.height - kToolbarHeight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: GroceryStoreList(),
                        ),
                      ),
                    ),

                    AnimatedPositioned(
                      curve: Curves.decelerate,
                      duration: _panelTransition,
                      left: 0,
                      right: 0,
                      top: _getTopForBlackPanel(bloc.groceryState, size),
                      height: size.height -kToolbarHeight,
                      child: GestureDetector(
                        onVerticalDragUpdate: _onVerticalGesture,
                        child: Container(
                          color: Colors.black,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: AnimatedSwitcher(
                                  duration: _panelTransition,
                                  child: bloc.groceryState == GroceryState.normal ? Row(
                                    children: [
                                      Text(
                                        'Cart',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Row(
                                              children: List.generate(
                                                  bloc.cart.length,
                                                  (index) => Stack(
                                                        children: [
                                                          Hero(
                                                            tag:
                                                                'list_${bloc.cart[index].product.name}details',
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          8),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                                child:
                                                                    Image.network(
                                                                  bloc
                                                                      .cart[index]
                                                                      .product
                                                                      .image,
                                                                  height: 40,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  errorBuilder: (BuildContext
                                                                          context,
                                                                      Object
                                                                          exception,
                                                                      StackTrace
                                                                          stackTrace) {
                                                                    return Text(
                                                                        'Your error widget...');
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: 0,
                                                            child: CircleAvatar(

                                                              radius: 10,
                                                              backgroundColor:
                                                                  Colors.red,
                                                              child: Text(
                                                                bloc.cart[index].quantity.toString(),
                                                                style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),),
                                            ),
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundColor:  Color(0xFFF4C459),
                                        child: Text(bloc.totalCartElements().toString(),),
                                      ),
                                    ],
                                  ): SizedBox.shrink(),
                                ),
                              ),
                              Expanded(child: GroceryStoreCart(),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                        curve: Curves.easeInOut,
                        duration: _panelTransition,
                        left: 0,
                        right: 0,
                        top: _getTopForAppBar(bloc.groceryState),
                        child: _AppbarGrocery(),),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class _AppbarGrocery extends StatefulWidget {
  @override
  __AppbarGroceryState createState() => __AppbarGroceryState();
}

class __AppbarGroceryState extends State<_AppbarGrocery> {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryStoreBloc();
    final blocc = GroceryProvider.of(context).bloc;
   List< String> deraf;
    return GroceryProvider(
      bloc: bloc,
      child: Container(
        height: kToolbarHeight,
        color: backgroundColor,
        child: Row(
          children: [
            BackButton(
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                'Fruits and vegetables',
                style: TextStyle(color: Colors.black),
              ),
            ),
            // Expanded(
            //     child: IconButton(
            //       icon:Icon(Icons.search),
            //       onPressed: (){},
            //     ),
            // ),
            Stack(
              children: [
                 IconButton(
                  icon:Icon(Icons.search),
                  onPressed: (){},
                ),
              ],
            ),
            Stack(
              children: [
                IconButton(icon: Icon(Icons.shopping_cart), onPressed: ()async{


                  print("Length ${blocc.totalCartElements().toString()}");
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(seconds: 1),
                      pageBuilder: (context, animation, __) {
                        return FadeTransition(
                          opacity: animation,
                          child: GroceryStoreCartDemo(
                            data: blocc.cart,
                          ),);
                      },
                    ),
                  );
                  // print(blocc.cart[0].product.name);
                },),
                Positioned(
                  right: 0,
                  child: CircleAvatar(

                    radius: 10,
                    backgroundColor:
                    Colors.red,
                    child: Text(
                      '${blocc.totalCartElements().toString()}',
                      style: TextStyle(
                        color: Colors
                            .white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
