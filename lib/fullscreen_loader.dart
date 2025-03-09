import 'package:counter_13/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IOIfullScreenLoader {
  static void openLoadingDialog(String text) {
    showDialog(
      useSafeArea: true,
      context: Get.overlayContext!,
      builder:
          (context) => PopScope(
            canPop: false,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  TAnimationLoaderWidget(
                    showactionButton: false,
                    actionText: 'okey',
                    text: text,
                  ),
                ],
              ),
            ),
          ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
