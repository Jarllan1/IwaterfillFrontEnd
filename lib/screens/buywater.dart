import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iwaterfill/screens/payment.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iwaterfill/services/product.dart';

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

  int? _selectedItem; // Variable to track the selected item

  final List<Map<String, String>> _items = [
    {'label': 'Container', 'image': 'assets/CONTAINER.png'},
    {'label': 'Dispenser', 'image': 'assets/ROUND CONTAINER.png'},
  ];

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
      resizeToAvoidBottomInset: false,
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

            // Radio buttons with images
            Column(
              children: _items.asMap().entries.map((entry) {
                int idx = entry.key;
                Map<String, String> item = entry.value;

                return Row(
                  children: [
                    Radio<int>(
                      value: idx,
                      groupValue: _selectedItem,
                      onChanged: (value) {
                        setState(() {
                          _selectedItem = value;
                        });
                      },
                    ),
                    Image.asset(
                      item['image']!,
                      height: 50.0,
                      width: 50.0,
                    ),
                    SizedBox(width: 10.0),
                    Text(item['label']!, style: TextStyle(fontSize: 16.0)),
                  ],
                );
              }).toList(),
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
            ElevatedButton(
              onPressed: () {
                // Navigate to the Payment screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Payment()),
                );
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
          ],
        ),
      ),
    );
  }
}
void main() {
  runApp(MaterialApp(
    home: BuyWater(),
  ));
}

