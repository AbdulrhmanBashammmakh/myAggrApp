import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  var internetStatus = ''.obs;

  @override
  void onInit() {
    super.onInit();
    checkInternetConnection();
  }

  void checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      internetStatus.value = 'Mobile data';
    } else if (connectivityResult == ConnectivityResult.wifi) {
      internetStatus.value = 'WiFi';
    } else {
      internetStatus.value = 'No internet connection';
    }

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        internetStatus.value = 'Mobile data';
      } else if (result == ConnectivityResult.wifi) {
        internetStatus.value = 'WiFi';
      } else {
        internetStatus.value = 'No internet connection';
      }
    });
  }
}
