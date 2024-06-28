import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iwaterfill/services/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.productName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(width: 10.0,),
                Text(
                 "(${product.productName})",
                 style: TextStyle(color: Colors.black),
                ),
              ],),
            Text(
              product.category,
            ),
            Text(
              "${product.price}"
            ),
          ],
        ),
      ),
    );
  }
}