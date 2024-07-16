import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iwaterfill/screens/buywater.dart';
import 'package:iwaterfill/services/product.dart';

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  late Future<List<Product>> products;

  Future<List<Product>> fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/v1/product/all'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      List<Product> productList = data.map((json) => Product.fromJson(json)).toList();
      return productList;
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  void initState() {
    super.initState();
    products = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: Image.asset(
          'assets/wafill.png',
          width: 300, // Adjust width as needed
          height: 60, // Adjust height as needed
          fit: BoxFit.contain, // Adjust the fit as needed
        ),
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
        IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white,),
        onPressed: () {
          Navigator.popAndPushNamed(context, '/');
        },
      ),
            ],
        ),

      ),
    );
  }
}
