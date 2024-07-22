import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:iwaterfill/screens/dashboard.dart';

class BuyWater extends StatefulWidget {
  const BuyWater({Key? key}) : super(key: key);

  @override
  State<BuyWater> createState() => _BuyWaterState();
}

class _BuyWaterState extends State<BuyWater> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  List<int> _quantities = [];

  final List<Map<String, dynamic>> _items = [
    {'label': 'Container', 'image': 'assets/CONTAINER.png', 'price': 250},
    {'label': 'Dispenser', 'image': 'assets/ROUND CONTAINER.png', 'price': 300},
  ];

  @override
  void initState() {
    super.initState();
    _quantities = List<int>.filled(_items.length, 0);

    _dateController.addListener(() {
      final text = _dateController.text;
      _dateController.value = _dateController.value.copyWith(
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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: Text('Make purchase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                _selectDate(context);
              },
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _dateController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    labelText: 'DATE',
                    hintText: 'MM/DD/YYYY',
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Display Selected Date
            Text(
              'Selected Date: ${_dateController.text}',
              style: TextStyle(fontSize: 18.0),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_cart),
                  SizedBox(width: 10.0),
                  Text('Place Order'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            // accentColor: Colors.blue,
            colorScheme: ColorScheme.light(primary: Colors.blue),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('MM/dd/yyyy').format(_selectedDate);
      });
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: BuyWater(),
  ));
}
