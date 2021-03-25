
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'grocery_store_products.dart';

class StreamingData extends StatefulWidget {

  @override
  _StreamingDataState createState() => _StreamingDataState();
}

class _StreamingDataState extends State<StreamingData> {

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Diary');
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: users.snapshots(),
            builder: (BuildContext context,  snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: ( context, index){
                 DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                  // snapshot.data.docs.map((document) {
                  //   return Center(
                  //     child: Text(document['name'],),
                  //   );
                  // }).toList();

                  return Column(
                    children: [
                      Text(documentSnapshot['name']),
                      Text(documentSnapshot['price'].toString()),
                      Text(documentSnapshot['description']),
                      Text(documentSnapshot['quantity']),
                      CircleAvatar(
                        child: Image.network(documentSnapshot['photo_url']),
                      )
                    ],
                  );
                },

              );
            }
    )
        ),);
  }
}



// ListTile(
// leading: Text('${Diary['price']}'),
// title: Text('${Diary['description']}'),
// subtitle: Text('${Diary['quantity']}'),
// trailing: CircleAvatar(
// backgroundColor:
// Colors.lightBlue[50],
// radius: 40.0,
// backgroundImage: NetworkImage(
// 'https://images.unsplash.com/photo-1573246123716-6b1782bfc499?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=660&q=80'),
// ),
// );