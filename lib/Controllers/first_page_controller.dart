import 'package:get/get.dart';
import 'package:myaggr/UI/Screen/pass_data_example/Second_Page.dart';

class FirstPageController extends GetxController {
  var text = ''.obs;

  void updateText(String value) {
    text.value = value;
  }

  void nextPage() => Get.to(SecondPage(), arguments: text.value);
}
