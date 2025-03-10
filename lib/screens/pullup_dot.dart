import 'package:counter_13/controller/OnbordingDot.dart';
import 'package:counter_13/controller/counter_controller.dart';
import 'package:counter_13/controller/onbordingController.dart';
import 'package:counter_13/screens/pushup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PullupDot extends StatelessWidget {
  const PullupDot({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnbordingController());
    final countController = Get.put(CounterController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pagecontroller,
            onPageChanged: controller.updatePageIndicator,
            children: [
              PushupScreen(
                sumOfCount: countController.totalpull,
                count: 'pullcount1',
                maxCount: countController.pull1maxPastCount,
                todayscount: countController.pullcount1,
              ),
              PushupScreen(
                sumOfCount: countController.totalpull,
                maxCount: countController.pull2maxPastCount,
                count: 'pullcount2',
                todayscount: countController.pullcount2,
              ),
              PushupScreen(
                sumOfCount: countController.totalpull,
                maxCount: countController.pull3maxPastCount,
                count: 'pullcount3',
                todayscount: countController.pullcount3,
              ),
            ],
          ),
          const OnBordingDotNavigation(),
        ],
      ),
    );
  }
}
