import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Register.dart';
import 'package:untitled/category.dart';
import 'Login.dart';

import 'dart:convert';
import 'dart:ffi';

import 'provider/category_provider.dart';
import 'provider/home_provider.dart';
import 'provider/login_provider.dart';
import 'provider/register_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => CategoryProvider()),
            ChangeNotifierProvider(create: (context) => HomeProvider()),
            ChangeNotifierProvider(create: (context) => RegisterProvider()),
            ChangeNotifierProvider(create: (context) => LoginProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Login(),
          ));
}
