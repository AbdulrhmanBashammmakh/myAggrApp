import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myaggr/Controllers/first_page_controller.dart';

class FirstPage extends StatelessWidget {
  final controller = Get.put(FirstPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => controller.updateText(value),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.nextPage(),
              child: Text('Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
