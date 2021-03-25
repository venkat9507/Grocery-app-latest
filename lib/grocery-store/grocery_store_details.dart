import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:fthdaily/grocery-store/grocery_store_products.dart';

import 'grocery_store_bloc.dart';


class GroceryStoreDetails extends StatefulWidget {
  final VoidCallback onProductAdded;
  final VoidCallback onProductRemoved;
  final GroceryProduct product;
  const GroceryStoreDetails({Key key, this.product, this.onProductAdded, this.onProductRemoved,}) : super(key: key);




  @override
  _GroceryStoreDetailsState createState() => _GroceryStoreDetailsState();
}

class _GroceryStoreDetailsState extends State<GroceryStoreDetails> {
String heroTag = '';
int counter = 1;
  void _addToCart(BuildContext context){

    setState(() {
      heroTag = 'details';
    });

    widget.onProductAdded();
  }

void _removeToCart(BuildContext context){

  setState(() {
    heroTag = 'details';
  });

  widget.onProductRemoved();
}
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryStoreBloc();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: ()=> Navigator.pop(context)),
        backgroundColor: Colors.white,
        title: Text('Product Image'),
        elevation: 0,
      ),
      body:
           Column(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Scrollbar(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index){

                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Hero(
                                tag: 'list_${widget.product.name}$heroTag',
                                child: Image.network(widget.product.image,fit: BoxFit.contain,height: MediaQuery.of(context).size.height * 0.36,),),
                            );
                          },
                        ),
                      ),
                    ),

                    Text(
                      widget.product.name,
                      style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      widget.product.weight,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),
                    ),

                         Row(
                          children: [
                            AnimatedButton(
                              onPressed: () {
                                _addToCart(context);
                                setState(() {
                                  counter++;
                                });
                              },
                              height: 40,
                              width: 70,
                              shadowDegree: ShadowDegree.dark,
                              color: Colors.grey,
                              child: Icon(Icons.add,color: Colors.white,),
                            ),
                            SizedBox(width: 5,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(counter.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,),),
                            ),
                            AnimatedButton(
                              onPressed: () {
                                _removeToCart(context);
                                setState(() {
                                  counter--;
                                });
                              },
                              height: 40,
                              width: 70,
                              shadowDegree: ShadowDegree.dark,
                              color: Colors.grey,
                              child: Icon(Icons.remove,color: Colors.white,),
                            ),
                            Spacer(),
                            Text(' \$ ${widget.product.price}', style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black,fontWeight: FontWeight.bold),)
                          ],
                        ),
                    Text(
                      'About the product',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.product.description,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey,fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                        child: IconButton(icon: Icon(Icons.favorite_border), onPressed: null)),
                    Expanded(
                      flex: 4,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text('Add to Cart',style: TextStyle(color: Colors.black),),
                        ),
                      color: Color(0xFFF4C459),
                        onPressed:()=> {
                          if(counter ==1){
                            _addToCart(context),
                            Navigator.pop(context),
                          }
                          else
                            {
                              Navigator.pop(context),
                              _addToCart(context),
                            }
                        }),)
                  ],
                ),
              )
            ],
          ),
    );


  }
}

