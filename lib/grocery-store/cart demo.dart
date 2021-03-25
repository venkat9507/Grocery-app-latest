import 'package:flutter/material.dart';
import 'package:fthdaily/grocery-store/grocery_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'grocery_store_bloc.dart';

class GroceryStoreCartDemo extends StatefulWidget {
  final  List<GroceryProductItem> data;

  const GroceryStoreCartDemo({Key key, this.data}) : super(key: key);




  @override
  _GroceryStoreCartDemoState createState() => _GroceryStoreCartDemoState();
}

class _GroceryStoreCartDemoState extends State<GroceryStoreCartDemo> {



  double totalPriceElements()=>
      widget.data.fold<double>(0.0, (previousValue, element) => previousValue + (element.quantity * element.product.price),);
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
                      Row(
                        children: [
                          BackButton(
                            onPressed: ()=> Navigator.pop(context),
                            color: Colors.white,
                          ),
                          Text(
                            'Cart',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: widget.data.length,
                            itemBuilder: (context,index){
                              final item =  widget.data[index];
                              print("  Cart Name Demo : ${widget.data.length}");
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
                                    Text(item.quantity.toString(),style: TextStyle(color: Colors.white,fontSize: 20,),),
                                    SizedBox(width: 10,),
                                    Text('x',style: TextStyle(color: Colors.white,fontSize: 20,),),
                                    SizedBox(width: 10,),
                                    Text(item.product.name, style: TextStyle(color: Colors.white,fontSize: 20,),),
                                    Spacer(),
                                    Text('\$ ${(item.product.price * item.quantity).toStringAsFixed(2)}',style: TextStyle(color: Colors.white,fontSize: 20,),),
                                    IconButton(icon: Icon(Icons.delete,size: 20,color: Colors.white,), onPressed:(){

                                    }),

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
                      '\$ ${totalPriceElements().toStringAsFixed(2)}',
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
                  onPressed:()=> {
                  }),
            ],
          ),
        ),
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  final  List<GroceryProductItem> data;

  const SecondPage({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Text('${data[0].product.name}')
        ],
      ),),
    );
  }
}
