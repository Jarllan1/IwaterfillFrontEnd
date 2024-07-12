import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: Image.asset(
          'assets/wafill.png',
          width: 300, // Adjust width as needed
          height: 60, // Adjust height as needed
          fit: BoxFit.contain, // Adjust the fit as needed
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                padding: EdgeInsets.all(20),
                children: <Widget>[
                  buildDashboardButton(
                    icon: Icons.person,
                    label: 'PROFILE',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                  buildDashboardButton(
                    icon: Icons.history,
                    label: 'TRANSACTION HISTORY',
                    onPressed: () {
                      // Navigate to Transaction History page
                    },
                  ),
                  buildDashboardButton(
                    icon: Icons.local_shipping,
                    label: 'DELIVERY STATUS',
                    onPressed: () {
                      // Navigate to Delivery Status page
                    },
                  ),
                  buildDashboardButton(
                    icon: Icons.shopping_cart,
                    label: 'BUY WATER',
                    onPressed: () {
                      // Navigate to Buy Water page
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDashboardButton({required IconData icon, required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[100],
        elevation: 5,
        shadowColor: Colors.grey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.blue[800],
          ),
          SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue[800],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Dashboard(),
  ));
}
