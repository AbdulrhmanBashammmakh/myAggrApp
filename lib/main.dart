import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myaggr/UI/Screen/home_page.dart';
import 'package:myaggr/UI/Screen/register_page.dart';
import 'UI/Screen/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage()
      //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

