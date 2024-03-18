import 'package:get/get.dart';

class RevenueSharingController extends GetxController {
  RxBool isPercentageVisible = false.obs;
  RxBool isPercentageValueVisible = true.obs;
  RxBool isButtonEnabled = false.obs;

  void togglePercentageVisibility() {
    isPercentageVisible.value = true;
    isPercentageValueVisible.value = false;
    isButtonEnabled.value = true;
  }
}
