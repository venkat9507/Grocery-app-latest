// import 'package:flutter/material.dart';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fthdaily/main.dart';
//
//
//
// class UserManagement {
//
//   StoreNewUser(user,context){
//     Firestore.instance.collection('/users').add({
//       'email' : FirebaseAuth.instance.currentUser.email,
//       'uid' : FirebaseAuth.instance.currentUser.uid,
//       'role' : 'User',
//     }).then((value) {
//       Navigator.pop(context);
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => MyApp()),
//       );
//     }).catchError((e){
//       print(e);
//     });
//   }
//
//
//
//
//   // userOnly(BuildContext context){
//   //   FirebaseAuth.instance.currentUser;{
//   //     Firestore.instance.collection('/users').where('email',isEqualTo: FirebaseAuth.instance.currentUser.email).getDocuments().then((docs){
//   //       if(docs.documents[0].exists){
//   //         if( docs.documents[0].get('role')=='Admin'){
//   //           Navigator.push(
//   //             context,
//   //             MaterialPageRoute(
//   //               builder: (context) =>
//   //                   AdminArea(),
//   //             ),
//   //           );
//   //         }else
//   //         {
//   //           Text('Only Admin Can view Data');
//   //           print('only admin');
//   //         }
//   //       }
//   //     });
//   //   }
//   // }
//
//
//   Future getUserList() async {
//    return await Firestore.instance.collection('users').snapshots();
//   }
//
// }