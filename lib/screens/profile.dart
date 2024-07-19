// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:iwaterfill/services/userdetail.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   String _name = '';
//   String _phone = '';
//   String _address = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _loadUserDetails();
//   }
//
//   Future<void> profile(Userdetail userdetail) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://10.0.2.2:8080/api/v1/auth/email'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, dynamic>{
//           'phoneNumber': userdetail.phoneNumber,
//           'address': userdetail.address,
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('name', data['name']);
//         await prefs.setString('phone', data['phone']);
//         await prefs.setString('address', data['address']);
//         _loadUserDetails();
//       } else {
//         throw Exception('Failed to load profile');
//       }
//     } catch (e) {
//       // Handle error
//       print(e);
//     }
//   }
//
//   Future<void> _loadUserDetails() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _name = prefs.getString('name') ?? '';
//       _phone = prefs.getString('phone') ?? '';
//       _address = prefs.getString('address') ?? '';
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             Text('Name: $_name', style: const TextStyle(fontSize: 18)),
//             Text('Phone: $_phone', style: const TextStyle(fontSize: 18)),
//             Text('Address: $_address', style: const TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }
// }
