import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'UI/Screen/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('products_box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        //   title: 'GetX Example',
        //   initialRoute: '/second',
        //   getPages: [
        //     GetPage(
        //         name: '/first',
        //         page: () => FirstPage(),
        //         binding: BindingsBuilder(() => Get.put(FirstPageController()))),
        //     GetPage(
        //         name: '/second',
        //         page: () => SecondPage(),
        //         binding: BindingsBuilder(() => Get.put(SecondPageController()))),
        //   ],
        // );
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage()
        //const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
