import 'package:get/get.dart';

class SignupController extends GetxController {
  var email = '';
  var password = '';
  var isLoading = false.obs;

  void signup() async {
    isLoading.value = true;
    // Perform signup logic here
    isLoading.value = false;
  }
}
