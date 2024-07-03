import 'package:flutter/material.dart';
import 'package:iwaterfill/services/product.dart';
import 'package:iwaterfill/widgets/product_card.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List products = <Product>[
    Product(productName: "Water Gallon", category: "null", price: 250.0),
    Product(productName: "Water Container", category: "null", price: 250.0),
  ];

  Widget cardTemplate(product){
    return ProductCard(product:  product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        title: Text("PRODUCTS",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
        ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white,),
            onPressed: (){
              //define action  when the button is pressed
              print('Add button pressed');
            },
          ),
        ],
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),


      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: products.map((product) => cardTemplate(product)). toList(),
        ),
      ),
    );
  }
}
