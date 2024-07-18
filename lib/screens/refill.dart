import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Refill extends StatefulWidget {
  const Refill({Key? key}) : super(key: key);

  @override
  _RefillState createState() => _RefillState();
}

class _RefillState extends State<Refill> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  List<int> _quantities = [];

  final List<Map<String, dynamic>> _items = [
    {'label': '5 Gallon', 'image': 'assets/5gallon.png', 'price': 150},
    {'label': '3 Gallon', 'image': 'assets/3gallon.png', 'price': 100},
  ];

  @override
  void initState() {
    super.initState();

    _quantities = List<int>.filled(_items.length, 0);

    _dateController.addListener(() {
      final text = _dateController.text;
      _dateController.value = TextEditingValue(
        text: _formatDate(text),
        selection: TextSelection.collapsed(offset: _formatDate(text).length),
      );
    });
  }

  String _formatDate(String text) {
    text = text.replaceAll(RegExp(r'[^0-9]'), '');
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
    _amountController.text = '₱' + totalAmount.toStringAsFixed(2);
  }

  @override
  void dispose() {
    _locationController.dispose();
    _amountController.dispose();
    _dateController.dispose();
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
        title: Text('Make Refill'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _dateController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                labelText: 'DATE',
                hintText: 'MM/DD/YYYY',
              ),
            ),
            SizedBox(height: 16.0),

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
                // Implement logic to place refill order
                // For now, navigate back to the dashboard
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_cart),
                  SizedBox(width: 10.0),
                  Text('Place Refill Order'),
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
    home: Refill(),
  ));
}
