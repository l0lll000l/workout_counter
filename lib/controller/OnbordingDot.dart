import 'package:counter_13/controller/onbordingController.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingDotNavigation extends StatelessWidget {
  const OnBordingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    final controller = OnbordingController.instance;
    return Positioned(
      bottom: 100,
      left: (screenSize - 100) / 2,
      child: SmoothPageIndicator(
        controller: controller.pagecontroller,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: const ExpandingDotsEffect(activeDotColor: Colors.white, dotHeight: 6),
      ),
    );
  }
}
