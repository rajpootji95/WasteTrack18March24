import 'package:get/get.dart';

class VendorManagementController extends GetxController {
  final RxList<bool> assignedVisibleList =
      List.generate(10, (index) => false).obs;
  final RxList<bool> notAssVisibleList =
      List.generate(10, (index) => false).obs;
  final RxList<bool> allVendorVisibleList =
      List.generate(10, (index) => false).obs;

  void AssignedVisibility(int index) {
    assignedVisibleList[index] = !assignedVisibleList[index];
  }

  void NotAssignedVisibility(int index) {
    notAssVisibleList[index] = !notAssVisibleList[index];
  }

  void AllVendorVisibility(int index) {
    allVendorVisibleList[index] = !allVendorVisibleList[index];
  }
}

class AllVendorStaffController extends GetxController {
  var isShowVisible = true.obs;

  final RxList<bool> areOptionVisibleList =
      List.generate(10, (index) => false).obs;

  void toggleVisibility(int index) {
    areOptionVisibleList[index] = !areOptionVisibleList[index];
  }

  void ShowVisibility() {
    isShowVisible.value = false;
  }

  var isContainerVisible = true.obs;

  void ContainerVisible() {
    isContainerVisible.value = false;
  }

  void ContainerHide() {
    isContainerVisible.value = true;
  }
}

class OrderHistoryVisibilityController extends GetxController {
  final RxList<bool> areOptionVisibleList =
      List.generate(10, (index) => false).obs;

  void toggleVisibility(int index) {
    areOptionVisibleList[index] = !areOptionVisibleList[index];
  }
}

class VendorRequestVisibilityController extends GetxController {
  var isContainerVisible = true.obs;
  var isShowVisible = true.obs;
  var isPeContainerVisible = true.obs;
  var isPeShowVisible = true.obs;

  void PeContainerVisible() {
    isPeContainerVisible.value = false;
  }

  void PeContainerHide() {
    isPeContainerVisible.value = true;
  }

  void PeShowVisibility() {
    isPeShowVisible.value = false;
  }

  void ContainerVisible() {
    isContainerVisible.value = false;
  }

  void ContainerHide() {
    isContainerVisible.value = true;
  }

  void ShowVisibility() {
    isShowVisible.value = false;
  }
}
