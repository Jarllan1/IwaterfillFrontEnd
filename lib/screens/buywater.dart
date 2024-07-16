import 'package:flutter/material.dart';

class BuyWater extends StatefulWidget {
  const BuyWater({super.key});

  @override
  State<BuyWater> createState() => _BuyWaterState();
}

class _BuyWaterState extends State<BuyWater> {
  // Controllers for the text fields
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: Text('Make Purchase'),
      ),
      body: Padding(

        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'DATE',
                hintText: 'MM/DD/YYYY',
              ),
            ),
            SizedBox(height: 16.0),

            // Item Field (with image)
            Row(
              children: [
                Text(
                  'ITEM',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(width: 10.0),
                Image.asset(
                  'assets/contain.jpg', // Make sure to add the image in the assets folder
                  height: 50.0,
                  width: 50.0,
                ),
                // Image.asset('assets/dispen.jpg',
                // height: 80.0,
                //   width: 50.0,
                // )
              ],
            ),
            SizedBox(height: 16.0),

            // Quantity Field
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'QTY',
              ),
            ),
            SizedBox(height: 16.0),

            // Location Field
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'LOCATION',
              ),
            ),
            SizedBox(height: 16.0),

            // Amount Field
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'AMOUNT',
              ),
            ),
            SizedBox(height: 16.0),

            // Place Order Button
            ElevatedButton(
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
