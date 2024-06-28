import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:iwaterfill/screens/login.dart';
// import 'package:iwaterfill/screens/dashboard_screen.dart';
import 'package:iwaterfill/screens/product_screen.dart';
import  'package:iwaterfill/screens/register.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 56, 150, 81),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          //backgroundColor: Colors.blueGrey,
          //selectedItemColor: Colors.white,
          //unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(size: 30),
          unselectedIconTheme: IconThemeData(size: 25),
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
        cardTheme: CardTheme(color: Colors.white,)
      ),
      debugShowCheckedModeBanner: false,
      home: const Register(),
    );
  }
}

class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeSceen> {
  int _selectedIndex = 0;

  //Remove the const keyboard
final List<Widget> _widgetOption = [
  // DashboardScreen(),
  ProductScreen(),
];

void _onItemTapped(int index) {
  setState(() {
    int _selectedIndex = index;
  });
}

@override
  Widget build(BuildContext context){
  return Scaffold(
    body: _widgetOption. elementAt(_selectedIndex),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.people),
        label: 'List of Customers',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Transaction History',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    ),
  );
}
}

