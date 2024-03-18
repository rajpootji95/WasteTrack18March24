import 'package:get/get.dart';

class OrderManagementController extends GetxController {
  RxBool isPayOnPickupVisible = false.obs;
  RxBool isButtonEnabled = false.obs;

  void ButtonVisibility() {
    isButtonEnabled.value = true;
  }

  void PayOnPickupVisibility() {
    isPayOnPickupVisible.value = true;
  }
}
