import 'package:flutter/material.dart';
import 'package:iwaterfill/screens/admindashboard.dart';
import 'package:iwaterfill/screens/login.dart';
import 'package:iwaterfill/screens/signup.dart';
import 'package:iwaterfill/screens/dashboard.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/admindashboard',
  routes: {
    '/' : (context) => Dashboard(),
    '/signup' : (context) => Signup(),
    '/login' : (context) => Login(),
    '/admindashboard' : (context) => Admindashboard(),
  },
));

