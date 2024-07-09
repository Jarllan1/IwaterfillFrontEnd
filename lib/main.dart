import 'package:flutter/material.dart';
import 'package:iwaterfill/Home.dart';
import 'package:iwaterfill/profile.dart';
import 'package:iwaterfill/screens/login.dart';
import 'package:iwaterfill/screens/product_screen.dart';
import 'package:iwaterfill/screens/signup.dart';
import 'package:iwaterfill/screens/dashboard.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/Home',
  routes: {
    '/' : (context) => Dashboard(),
    '/product_screen' : (context) => ProductScreen(),
    '/signup' : (context) => Signup(),
    '/login' : (context) => Login(),
    '/profile' : (context) => Profile(),
    '/Home' : (context) => Home(),
  },
));

