import 'package:flutter/material.dart';
import 'package:iwaterfill/screens/admindashboard.dart';
import 'package:iwaterfill/screens/buywater.dart';
import 'package:iwaterfill/screens/login.dart';
import 'package:iwaterfill/screens/signup.dart';
import 'package:iwaterfill/screens/dashboard.dart';
import 'package:iwaterfill/screens/transactionhistory.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Dashboard(),
    '/signup' : (context) => Signup(),
    '/login' : (context) => Login(),
    // '/admindashboard' : (context) => Admindashboard(),
    '/buywater' : (context) => BuyWater(),
    '/transactionhistory' : (context) => Transactionhistory(),
  },
));

