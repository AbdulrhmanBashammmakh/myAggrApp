import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myaggr/Controllers/first_page_controller.dart';

class SecondPage extends StatelessWidget {
  final controller = Get.put(FirstPageController());
  //Get.find<SecondPageController>();
  String x = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.text.value
                //    controller.text.value
                ),
          ],
        ),
      ),
    );
  }
}
