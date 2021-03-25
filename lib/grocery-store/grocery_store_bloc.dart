import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fthdaily/grocery-store/grocery_store_products.dart';

List<GroceryProduct> groceryProducts = [];
enum GroceryState {
  normal,
  details,
  cart,
}

class GroceryStoreBloc with ChangeNotifier {

  GroceryState groceryState = GroceryState.normal;
List<GroceryProduct> catalog = groceryProducts;
List<GroceryProductItem> cart = [];
  void changeToNormal(){
    groceryState = GroceryState.normal;
    notifyListeners();
  }


  void changeToCart(){
    groceryState = GroceryState.cart;
    notifyListeners();
  }


  void deleteProduct(GroceryProductItem productItem){

    cart.remove(productItem);
    notifyListeners();
  }



  void addProduct(GroceryProduct product){
    for(GroceryProductItem item in cart){
      if(item.product.name == product.name){
        item.increment();
        notifyListeners();
        return;
      }
    }
    cart.add(GroceryProductItem(product: product));
    notifyListeners();
  }




  void removeProduct(GroceryProduct product){
    for(GroceryProductItem item in cart){
      if(item.product.name == product.name){
        item.decerement();
        notifyListeners();
        return;
      }
    }
    cart.remove((GroceryProductItem(product: product)),);
    notifyListeners();
  }

  int totalCartElements()=>
    cart.fold<int>(0, (previousValue, element) => previousValue + element.quantity,);

  double totalPriceElements()=>
      cart.fold<double>(0.0, (previousValue, element) => previousValue + (element.quantity * element.product.price),);


  Future<List<GroceryProduct>> getdata() async {
    CollectionReference ref = FirebaseFirestore.instance.collection('Diary');
    QuerySnapshot querySnapshot = await ref.get();

    querySnapshot.docs.forEach((element) {
      groceryProducts.add(
        GroceryProduct(
          price: element.get('price'),
          name: element.get('name'),
          description: element.get('description'),
          image: element.get('photo_url'),
          weight: element.get('quantity'),
        ),
      );
    });
    print(groceryProducts[0].image);
    return groceryProducts;
  }

}


class GroceryProductItem {
  GroceryProductItem({this.quantity =1, @required this.product});
  int quantity;
  final GroceryProduct product;


  void increment() {
    quantity++;
  }

  void decerement(){
    quantity--;
  }
}

