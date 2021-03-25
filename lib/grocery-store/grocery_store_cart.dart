import 'package:flutter/material.dart';
import 'package:fthdaily/grocery-store/grocery_provider.dart';

import 'grocery_store_bloc.dart';

class GroceryStoreCart extends StatefulWidget {

  @override
  _GroceryStoreCartState createState() => _GroceryStoreCartState();
}

class _GroceryStoreCartState extends State<GroceryStoreCart> {


  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;
    return  SafeArea(
        child: Padding(
         padding: const EdgeInsets.only(bottom: 60),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: [
                     Text(
                       'Cart',
                       style: Theme.of(context)
                           .textTheme
                           .headline4
                           .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                     ),
                     Expanded(
                       child: ListView.builder(
                         itemCount: bloc.cart.length,
                           itemBuilder: (context,index){
                           final item =  bloc.cart[index];
                           // print("  Cart Name : ${item.product.name}");
                         return Padding(
                           padding: const EdgeInsets.symmetric(vertical: 15),
                           child: Row(
                             children: [
                               ClipRRect(
                                 borderRadius:
                                 BorderRadius
                                     .circular(
                                     8.0),
                                 child:
                                 Image.network(
                                       item.product
                                       .image,
                                   height: 20,
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
                               SizedBox(width: 15,),
                               Text(item.quantity.toString(),style: TextStyle(color: Colors.white),),
                               SizedBox(width: 10,),
                               Text('x',style: TextStyle(color: Colors.white),),
                               SizedBox(width: 10,),
                               Text(item.product.name, style: TextStyle(color: Colors.white),),
                               Spacer(),
                               Text('\$ ${(item.product.price * item.quantity).toStringAsFixed(2)}',style: TextStyle(color: Colors.white),),
                               IconButton(icon: Icon(Icons.delete), onPressed: (){
                                 bloc.deleteProduct(item);
                               },color: Colors.white,),
                             ],
                           ),
                         );
                       }),
                     ),
                   ],
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Row(
                 children: [
                 Text('Total',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w600,),),
                   Spacer(),
                   Text(
                     '\$ ${bloc.totalPriceElements().toStringAsFixed(2)}',
                     style: Theme.of(context)
                         .textTheme
                         .headline4
                         .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                   ),
                 ],
               ),
             ),
             SizedBox(height: 15,),
             RaisedButton(
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(16)
                 ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(vertical: 12),
                   child: Text('Next',style: TextStyle(color: Colors.black),),
                 ),
                 color: Color(0xFFF4C459),
                 onPressed:()=> null ),
           ],
         ),
            ),
      );
  }
}
