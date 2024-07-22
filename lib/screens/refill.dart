import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iwaterfill/screens/dashboard.dart'; // Import for date formatting

void main() {
  runApp(MaterialApp(
    home: Refill(),
  ));
}

class Refill extends StatefulWidget {
  const Refill({Key? key}) : super(key: key);

  @override
  _RefillState createState() => _RefillState();
}

class _RefillState extends State<Refill> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now(); // Initialize with current date
  List<int> _quantities = [];

  final List<Map<String, dynamic>> _items = [
    {'label': '5 gallons', 'image': 'assets/CONTAINER.png', 'price': 25},
    {'label': '5 gallons', 'image': 'assets/ROUND CONTAINER.png', 'price': 30},
  ];

  @override
  void initState() {
    super.initState();
    _quantities = List<int>.filled(_items.length, 0);
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
    super.dispose();
  }

  String _formatDate(DateTime selectedDate) {
    return DateFormat('MM/dd/yyyy').format(selectedDate);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  bool _validateFields() {
    if (_locationController.text.isEmpty ||
        _amountController.text.isEmpty ||
        _selectedDate == null) {
      return false;
    }

    // Check if at least one item quantity is greater than 0
    bool hasSelectedItems = _quantities.any((quantity) => quantity > 0);
    if (!hasSelectedItems) {
      // Optionally show a snackbar or dialog to prompt the user to select items
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select at least one item.'),
        ),
      );
      return false;
    }

    return true;
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
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Date Field with Date Picker
              GestureDetector(
                onTap: () {
                  _selectDate(context); // Show date picker on tap
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: TextEditingController(text: _formatDate(_selectedDate)),
                    decoration: InputDecoration(
                      labelText: 'DATE',
                      hintText: 'MM/DD/YYYY',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select a date';
                      }
                      // Validate format or other rules if needed
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Item List with Quantity Selector
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
                  // Validate if all required fields are filled up
                  if (_validateFields()) {
                    // All fields are filled up, navigate to the dashboard
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  }
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
      ),
    );
  }
}
