import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iwaterfill/services/product.dart';

void main() {

  runApp(MaterialApp(
    home: BuyWater(),
  ));
}

class BuyWater extends StatefulWidget {

  const BuyWater({Key? key,}) : super(key: key);

  @override
  State<BuyWater> createState() => _BuyWaterState();
}

class _BuyWaterState extends State<BuyWater> {
  // Controllers for the text fields
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _quantityController.dispose();
    _locationController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: Text('𝓜𝓪𝓴𝓮 𝓟𝓾𝓻𝓬𝓱𝓪𝓼𝓮'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/');
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Date',
                hintText: 'MM/DD/YYYY',
              ),
            ),
            SizedBox(height: 16.0),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Item',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(width: 10.0),
                // Image.network(
                //   widget.product.url, // Display product image from URL
                //   height: 50.0,
                //   width: 50.0,
                // ),
              ],
            ),
            SizedBox(height: 16.0),

            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantity',
              ),
            ),
            SizedBox(height: 16.0),

            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location',
              ),
            ),
            SizedBox(height: 16.0),

            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            SizedBox(height: 16.0),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement your order placement logic here
                  print('Order Placed');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 10.0),
                    Text('PLACE ORDER'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
