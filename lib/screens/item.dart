// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:iwaterfill/screens/buywater.dart';
// import 'package:iwaterfill/services/product.dart';
//
//
// class Item extends StatefulWidget {
//   const Item({super.key});
//
//   @override
//   State<Item> createState() => _ItemState();
// }
//
// class _ItemState extends State<Item> {
//   late Future<List<Product>> products;
//
//   Future<List<Product>> fetchData() async {
//     final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/v1/product/all'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       List<Product> productList = data.map((json) => Product.fromJson(json)).toList();
//       return productList;
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     products = fetchData();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         foregroundColor: Colors.white,
//         title: Center(
//           child: Image.asset(
//             'assets/menu.png',
//             height: 50.0,
//             width: 450.0,
//           ),
//         ),
//         centerTitle: true,
//         automaticallyImplyLeading: false, // This line removes the default back button
//       ),
//
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/sea.jpg'), // Replace with your background image path
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
//           child: FutureBuilder<List<Product>>(
//             future: products,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: SpinKitDancingSquare(
//                     color: Colors.black,
//                     size: 60.0,
//                   ),
//                 );
//               }
//
//               if (snapshot.hasData) {
//                 List<Product> products = snapshot.data!;
//                 return Padding(
//                   padding: EdgeInsets.all(3.0),
//                   child: ListView.builder(
//                     itemCount: products.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         height: 100,
//                         width: double.infinity,
//                         margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
//                         child: Card(
//                           color: Colors.black,
//                           child: ListTile(
//                             title: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   products[index].productName,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Price: ${products[index].price.toString()}',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             leading: CircleAvatar(
//                               backgroundImage: NetworkImage(products[index].url),
//                             ),
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => BuyWater(buywater: products[index]),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               }
//
//               return Center(
//                 child: Text('Unable to load data'),
//               );
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Implement your back button functionality here
//           Navigator.pop(context);
//         },
//         child: Icon(Icons.arrow_circle_right_sharp, color: Colors.red),
//         backgroundColor: Colors.black,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Adjust as needed
//     );
//   }
// }
