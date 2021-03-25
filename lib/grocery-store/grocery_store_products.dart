import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroceryProduct  {
  final int price;
  final String name;
  final String description;
  final String image;
  final String weight;

 const  GroceryProduct({this.price, this.name, this.description, this.image, this.weight});


}


// const List<GroceryProduct> groceryProducts = [
//   GroceryProduct(
//     price: 8.30,
//     name: 'Avacado',
//     description: 'The avocado, a tree likely originating from southcentral Mexico, is classified as a member of the flowering plant family Lauraceae. The fruit of the plant, also called an avocado, is botanically a large berry containing a single large seed.',
//     image: 'https://pngimg.com/uploads/avocado/avocado_PNG15489.png',
//     weight:'500g' ,
//   ),
//   GroceryProduct(
//     price: 11.00,
//     name: 'Banana',
//     description: 'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called "plantains", distinguishing them from dessert bananas. ',
//     image: 'https://pngimg.com/uploads/banana/banana_PNG848.png',
//     weight:'500g' ,
//   ),
//   GroceryProduct(
//     price: 15.00,
//     name: 'Mango',
//     description: 'A mango is a stone fruit produced from numerous species of tropical trees belonging to the flowering plant genus Mangifera, cultivated mostly for their edible fruit. Most of these species are found in nature as wild mangoes. The genus belongs to the cashew family Anacardiaceae.',
//     image: 'https://pngimg.com/uploads/mango/mango_PNG9168.png',
//     weight:'500g' ,
//   ),
//
//   GroceryProduct(
//     price: 8.30,
//     name: 'Avacado',
//     description: 'The avocado, a tree likely originating from southcentral Mexico, is classified as a member of the flowering plant family Lauraceae. The fruit of the plant, also called an avocado, is botanically a large berry containing a single large seed.',
//     image: 'https://pngimg.com/uploads/avocado/avocado_PNG15489.png',
//     weight:'500g' ,
//   ),
//   GroceryProduct(
//     price: 11.00,
//     name: 'Banana',
//     description: 'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called "plantains", distinguishing them from dessert bananas. ',
//     image: 'https://pngimg.com/uploads/banana/banana_PNG848.png',
//     weight:'500g' ,
//   ),
//   GroceryProduct(
//     price: 15.00,
//     name: 'Mango',
//     description: 'A mango is a stone fruit produced from numerous species of tropical trees belonging to the flowering plant genus Mangifera, cultivated mostly for their edible fruit. Most of these species are found in nature as wild mangoes. The genus belongs to the cashew family Anacardiaceae.',
//     image: 'https://pngimg.com/uploads/mango/mango_PNG9168.png',
//     weight:'500g' ,
//   ),
//
//   GroceryProduct(
//     price: 8.30,
//     name: 'Avacado',
//     description: 'The avocado, a tree likely originating from southcentral Mexico, is classified as a member of the flowering plant family Lauraceae. The fruit of the plant, also called an avocado, is botanically a large berry containing a single large seed.',
//     image: 'https://pngimg.com/uploads/avocado/avocado_PNG15489.png',
//     weight:'500g' ,
//   ),
//   GroceryProduct(
//     price: 11.00,
//     name: 'Banana',
//     description: 'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called "plantains", distinguishing them from dessert bananas. ',
//     image: 'https://pngimg.com/uploads/banana/banana_PNG848.png',
//     weight:'500g' ,
//   ),
//   GroceryProduct(
//     price: 15.00,
//     name: 'Mango',
//     description: 'A mango is a stone fruit produced from numerous species of tropical trees belonging to the flowering plant genus Mangifera, cultivated mostly for their edible fruit. Most of these species are found in nature as wild mangoes. The genus belongs to the cashew family Anacardiaceae.',
//     image: 'https://pngimg.com/uploads/mango/mango_PNG9168.png',
//     weight:'500g' ,
//   ),
//   GroceryProduct(
//     price: 8.30,
//     name: 'Avacado',
//     description: 'The avocado, a tree likely originating from southcentral Mexico, is classified as a member of the flowering plant family Lauraceae. The fruit of the plant, also called an avocado, is botanically a large berry containing a single large seed.',
//     image: 'https://pngimg.com/uploads/avocado/avocado_PNG15489.png',
//     weight:'500g' ,
//   ),
//   GroceryProduct(
//     price: 11.00,
//     name: 'Banana',
//     description: 'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called "plantains", distinguishing them from dessert bananas. ',
//     image: 'https://pngimg.com/uploads/banana/banana_PNG848.png',
//     weight:'500g' ,
//   ),
//   GroceryProduct(
//     price: 15.00,
//     name: 'Mango',
//     description: 'A mango is a stone fruit produced from numerous species of tropical trees belonging to the flowering plant genus Mangifera, cultivated mostly for their edible fruit. Most of these species are found in nature as wild mangoes. The genus belongs to the cashew family Anacardiaceae.',
//     image: 'https://pngimg.com/uploads/mango/mango_PNG9168.png',
//     weight:'500g' ,
//   ),
//
// ];

