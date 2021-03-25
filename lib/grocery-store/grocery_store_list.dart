import 'package:flutter/material.dart';
import 'package:fthdaily/grocery-store/grocery_provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fthdaily/grocery-store/grocery_store_details.dart';
import 'package:fthdaily/grocery-store/staggerred_dual_view.dart';

import 'Grocery_Store_home.dart';

class GroceryStoreList extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.only(top: cartBarHeight),
      child: StaggeredDualView(
        aspectRatio: 0.7,
        offsetPercent: 0.3,
        itemCount: bloc.catalog.length,
        itemBuilder: (BuildContext context, int index) {
          final product = bloc.catalog[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 900),
                  pageBuilder: (context, animation, __) {
                    return FadeTransition(
                        opacity: animation,
                        child: GroceryStoreDetails(
                            product: product,
                            onProductAdded: () {
                              bloc.addProduct(product);
                            },
                          onProductRemoved: (){
                              bloc.removeProduct(product);
                          },
                        ),);
                  },
                ),
              );
            },
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Hero(
                        tag: '$index  ${product.name}',
                        child: Image.network(
                          product.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      '\$ ${product.price}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      ' ${product.name}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      ' ${product.weight}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
