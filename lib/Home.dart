import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        title: Text(
          'HOME',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Colors.lightBlue[900],
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3.0,
        onTap: (int val){
          switch(val){
            case 0:
              Navigator.pushNamed(context, '/signup');
              break;
            case 1:
              Navigator.pushNamed(context, '/login');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
        currentIndex: 0,
        items: const[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
          label: 'signup'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: 'login'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile'
          ),

        ],
      ),
    );
  }
}
