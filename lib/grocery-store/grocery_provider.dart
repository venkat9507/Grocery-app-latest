import 'package:flutter/material.dart';
import 'package:fthdaily/grocery-store/grocery_store_bloc.dart';

class GroceryProvider extends InheritedWidget {
  final GroceryStoreBloc bloc;
  final Widget child;

  GroceryProvider({this.bloc, this.child}) :  super(child:  child);


  static GroceryProvider of(BuildContext context ) => context.dependOnInheritedWidgetOfExactType<GroceryProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}