import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import FilteringTextInputFormatter
import 'package:iwaterfill/screens/payment.dart';

class BuyWater extends StatefulWidget {
  const BuyWater({super.key});

  @override
  State<BuyWater> createState() => _BuyWaterState();
}

class _BuyWaterState extends State<BuyWater> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController(); // Controller for DATE field

  List<int> _quantities = []; // List to store quantities for each item

  final List<Map<String, dynamic>> _items = [
    {'label': 'Container', 'image': 'assets/CONTAINER.png', 'price': 250},
    {'label': 'Dispenser', 'image': 'assets/ROUND CONTAINER.png', 'price': 300},
  ];

  @override
  void initState() {
    super.initState();
    // Initialize quantities list with 0 for each item
    _quantities = List<int>.filled(_items.length, 0);

    // Attach listener to date controller to format as MM/DD/YYYY
    _dateController.addListener(() {
      final text = _dateController.text;
      _dateController.value = _dateController.value.copyWith(
        text: _formatDate(text),
        selection: TextSelection.collapsed(offset: _formatDate(text).length),
      );
    });
  }

  // Function to format the date MM/DD/YYYY
  String _formatDate(String text) {
    text = text.replaceAll(RegExp(r'[^0-9]'), ''); // Remove non-numeric characters
    if (text.length >= 3) {
      text = text.substring(0, 2) + '/' + text.substring(2);
    }
    if (text.length >= 6) {
      text = text.substring(0, 5) + '/' + text.substring(5);
    }
    return text;
  }

  void _updateAmount() {
    double totalAmount = 0;
    for (int i = 0; i < _items.length; i++) {
      totalAmount += _quantities[i] * _items[i]['price'];
    }
    _amountController.text = '₱' + totalAmount.toStringAsFixed(2); // Prefix with peso sign
  }

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
            Navigator.popAndPushNamed(context, '/'); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _dateController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Accepts only digits
              ],
              decoration: InputDecoration(
                labelText: 'DATE',
                hintText: 'MM/DD/YYYY',
              ),
            ),
            SizedBox(height: 16.0),

            // List of items with quantities
            ListView.builder(
              shrinkWrap: true,
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          _items[index]['image'],
                          height: 50.0,
                          width: 50.0,
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _items[index]['label'],
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              '₱${_items[index]['price'].toString()}',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (_quantities[index] > 0) {
                                    _quantities[index]--;
                                    _updateAmount();
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            Text(_quantities[index].toString()),
                            SizedBox(width: 10.0),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  _quantities[index]++;
                                  _updateAmount();
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                  ],
                );
              },
            ),

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
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'AMOUNT',
              ),
            ),
            SizedBox(height: 16.0),

            // Place Order Button
            ElevatedButton(
              onPressed: () {
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
