import 'package:flutter/material.dart';
import 'package:iwaterfill/screens/payment.dart';

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

  int? _selectedItem; // Variable to track the selected item

  final List<Map<String, String>> _items = [
    {'label': 'Container', 'image': 'assets/CONTAINER.png'},
    {'label': 'Dispenser', 'image': 'assets/ROUND CONTAINER.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: Text('Make Purchase'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/');// Navigate back to the previous screen
          },
        ),
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
