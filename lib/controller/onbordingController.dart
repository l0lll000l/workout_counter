import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

class OnbordingController extends GetxController {
  static OnbordingController get instance => Get.find();

  ///variables
  final pagecontroller = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// update current index when page scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  ///jumb to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pagecontroller.jumpToPage(index);
  }
}
//
