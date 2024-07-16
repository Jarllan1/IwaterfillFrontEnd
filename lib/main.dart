import 'package:flutter/material.dart';
import 'package:iwaterfill/screens/buywater.dart';
import 'package:iwaterfill/screens/item.dart';
import 'package:iwaterfill/screens/login.dart';
import 'package:iwaterfill/screens/signup.dart';
import 'package:iwaterfill/screens/dashboard.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/buywater',
  routes: {
    '/' : (context) => Dashboard(),
    '/signup' : (context) => Signup(),
    '/login' : (context) => Login(),
    '/item' : (context) => Item(),
    '/buywater' : (context) => BuyWater(),

  }
));

