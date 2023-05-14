import 'package:get/get.dart';

class SecondPageController extends GetxController {
  var text = ''.obs;

  @override
  void onInit() {
    super.onInit();
    text.value = Get.arguments;
  }
}
