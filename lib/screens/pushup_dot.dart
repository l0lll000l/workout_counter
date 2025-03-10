import 'package:counter_13/controller/OnbordingDot.dart';
import 'package:counter_13/controller/counter_controller.dart';
import 'package:counter_13/controller/onbordingController.dart';
import 'package:counter_13/screens/pushup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PushupDot extends StatelessWidget {
  const PushupDot({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnbordingController());
    controller.currentPageIndex.value = 0;
    final countController = Get.put(CounterController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pagecontroller,
            onPageChanged: controller.updatePageIndicator,
            children: [
              PushupScreen(
                todaytotal: countController.todayspush,
                text: 'Pushups',
                sumOfCount: countController.totalpush,
                count: 'pushcount1',
                maxCount: countController.push1maxPastCount,
                todayscount: countController.pushcount1,
              ),
              PushupScreen(
                todaytotal: countController.todayspush,
                text: 'Pushups',
                sumOfCount: countController.totalpush,
                maxCount: countController.push2maxPastCount,
                count: 'pushcount2',
                todayscount: countController.pushcount2,
              ),
              PushupScreen(
                todaytotal: countController.todayspush,
                text: 'Pushups',
                sumOfCount: countController.totalpush,
                maxCount: countController.push3maxPastCount,
                count: 'pushcount3',
                todayscount: countController.pushcount3,
              ),
            ],
          ),
          const OnBordingDotNavigation(),
        ],
      ),
    );
  }
}
