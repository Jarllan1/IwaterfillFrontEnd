// import 'package:flutter/material.dart';
//
// class Admindashboard extends StatefulWidget {
//   const Admindashboard({Key? key}) : super(key: key);
//
//   @override
//   State<Admindashboard> createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Admindashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[200],
//       appBar: AppBar(
//         backgroundColor: Colors.grey[200],
//         centerTitle: true,
//         title: Image.asset(
//           'assets/wafill.png',
//           width: 120, // Adjust width as needed
//           height: 60, // Adjust height as needed
//           fit: BoxFit.contain, // Adjust the fit as needed
//         ),
//         leading: Builder(
//           builder: (context) => IconButton(
//             icon: Icon(Icons.menu),
//             onPressed: () {
//               Scaffold.of(context).openDrawer();
//             },
//           ),
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'Menu',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             buildDrawerItem('LIST OF CUSTOMER', () {
//               Navigator.pop(context); // Close the drawer
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ListOfCustomerScreen()),
//               );
//             }),
//             buildDrawerItem('TRANSACTION HISTORY', () {
//               Navigator.pop(context); // Close the drawer
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => TransactionHistoryScreen()),
//               );
//             }),
//             buildDrawerItem('AVAILABLE CONTAINER', () {
//               Navigator.pop(context); // Close the drawer
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AvailableContainerScreen()),
//               );
//             }),
//           ],
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () {
//                     // Navigator.popAndPushNamed(context, '/buywater');
//                   },
//                   child: buildInfoCard('TOTAL CUSTOMER', Icons.person),
//                 ),
//               ),
//               SizedBox(width: 20), // Add space between the cards
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () {
//                     // Navigator.popAndPushNamed(context, '/signup');
//                   },
//                   child: buildInfoCard('ONLINE ORDERS', Icons.shopping_cart),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           GestureDetector(
//             onTap: () {
//               // Navigator.popAndPushNamed(context, '/signup'),
//             },
//             child: buildReportCard('TOTAL SALES'),
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () {
//                     //Navigator.popAndPushNamed(context, '/signup'),
//                   },
//                   child: buildActionButton('ADD PURCHASE', Icons.add_shopping_cart),
//                 ),
//               ),
//               SizedBox(width: 20), // Add space between the buttons
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () {
//                     //Navigator.popAndPushNamed(context, '/signup'),
//                   },
//                   child: buildActionButton('REPORT', Icons.bar_chart),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//
//     );
//   }
//
//   Widget buildDrawerItem(String label, VoidCallback onTap) {
//     return ListTile(
//       title: Text(label),
//       onTap: onTap,
//     );
//   }
//
//   Widget buildInfoCard(String label, IconData icon) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       margin: EdgeInsets.symmetric(horizontal: 10), // Add margin for spacing
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 40, color: Colors.blue),
//           SizedBox(height: 10),
//           Text(
//             label,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildReportCard(String label) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       margin: EdgeInsets.symmetric(horizontal: 10), // Add margin for spacing
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             label,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'Total Sales Data',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.grey[600],
//               fontWeight: FontWeight.normal,
//               fontSize: 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildActionButton(String label, IconData icon) {
//     return ElevatedButton(
//       onPressed: () {},
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.blue[100],
//         elevation: 5,
//         shadowColor: Colors.grey,
//         minimumSize: Size(180, 120), // Adjust size as needed
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             size: 50,
//             color: Colors.blue[800],
//           ),
//           SizedBox(height: 10),
//           Text(
//             label,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.blue[800],
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ListOfCustomerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('List of Customer')),
//       body: Center(
//         child: Text('List of Customer Screen'),
//       ),
//     );
//   }
// }
//
// class TransactionHistoryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Transaction History')),
//       body: Center(
//         child: Text('Transaction History Screen'),
//       ),
//     );
//   }
// }
//
// class AvailableContainerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Available Container')),
//       body: Center(
//         child: Text('Available Container Screen'),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: Admindashboard(),
//   ));
// }
