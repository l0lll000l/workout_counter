import 'package:counter_13/screens/pullup_dot.dart';
import 'package:counter_13/screens/pushup_dot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Obx(
        () => NavigationBar(
          indicatorColor: Colors.black.withAlpha(5),
          backgroundColor: Colors.transparent,
          onDestinationSelected:
              (value) => controller.selectedIndex.value = value,
          selectedIndex: controller.selectedIndex.value,
          elevation: 0,
          height: 80,
          destinations: const [
            NavigationDestination(
              icon: Image(image: AssetImage('assets/pushup.png'), width: 50),
              label: 'Pushup',
            ),
            NavigationDestination(
              icon: Image(image: AssetImage('assets/pullup.png'), width: 50),
              label: 'Pullup',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final screens = [PushupDot(), PullupDot()];
}
