import 'package:flutter/material.dart';

// Dummy transaction data
class TransactionHistory {
  final String id;
  final String date;
  final double amount;
  final String location;
  final int qty; // Quantity of refills
  final String type; // Type of transaction (gallons or containers)

  TransactionHistory ({
    required this.id,
    required this.date,
    required this.amount,
    required this.location,
    required this.qty,
    required this.type,
  });
}

// Transaction history widget
class Transactionhistory extends StatefulWidget {
  const Transactionhistory({Key? key}) : super(key: key);

  @override
  State<Transactionhistory> createState() => _TransactionhistoryState();
}

class _TransactionhistoryState extends State<Transactionhistory> {
  List<TransactionHistory> transactions = []; // Remove dummy data initialization

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          IconData iconData = transaction.type == 'gallons' ? Icons.local_drink : Icons.shopping_cart; // Choose icon based on transaction type
          String unit = transaction.type == 'gallons' ? 'Gallons' : 'Containers'; // Display unit based on transaction type

          return Card(
            color: Colors.blue[100],
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(iconData),
              ),
              title: Row(
                children: [
                  Text('${transaction.qty} $unit'), // Display quantity with units
                  SizedBox(width: 8.0),
                  Text('at ${transaction.location}'),
                ],
              ),
              subtitle: Text('Amount: ₱${transaction.amount.toString()}'),
              trailing: Text(transaction.date),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Transactionhistory(),
  ));
}
