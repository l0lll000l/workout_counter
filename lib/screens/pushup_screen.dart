import 'dart:math';

import 'package:counter_13/controller/counter_controller.dart';
import 'package:counter_13/controller/onbordingController.dart';
import 'package:counter_13/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PushupScreen extends StatelessWidget {
  PushupScreen({
    super.key,
    required this.count,
    required this.todayscount,
    required this.maxCount,
  });
  final count;
  late var todayscount;
  late var maxCount;

  // final random = Random();
  final counterController = Get.put(CounterController());

  List<String> pushupQuotes = [
    "Every rep makes you stronger! 💪🔥",
    "No excuses, just reps!",
    "Push yourself up, pull yourself higher!",
    "Strength is built one rep at a time!",
    "Push harder, pull stronger!",
    "Your only limit is the one you refuse to break!",
    "One more rep, one step closer to greatness!",
    "Sweat now, shine later! ",
    "Discipline is doing reps when no one is watching!",
    "Train insane or remain the same!",
    "Power through the pain, grow through the struggle!",
    "The body achieves what the mind believes!",
    "No shortcuts, just hard work!",
    "Push past your limits, pull towards success!",
    "A rep today, strength tomorrow!",
    "Your future self will thank you for every rep!",
    "Keep grinding, keep climbing!",
    "The only bad workout is the one that didnt happen!",
    "Make every rep count!",
    "Strength doesnt come from what you can do, it comes from overcoming what you once thought you couldn’t!",
    "Hard work beats talent when talent doesnt work hard!",
    "Reps today, results tomorrow!",
    "Stay strong, stay consistent!",
    "Push, pull, conquer!",
    "The pain you feel today is the strength you gain tomorrow!",
    "It never gets easier, you just get stronger!",
    "You don’t find willpower, you build it , one rep at a time!",
    "Push up, pull up, level up! 🔥",
    "Your body can handle it, your mind just needs to believe it!",
    "Nothing changes if nothing moves , keep pushing, keep pulling!",
    "More reps, more gains!",
    "Push through the struggle, pull through the doubt!",
    "Strength is earned, not given!",
    "You are stronger than you think!",
  ];
  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.put(OnbordingController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Obx(
            () => Text(
              'Rep ${onboardingController.currentPageIndex.value + 1}',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(width: 12),
        ],
        backgroundColor: Colors.transparent,
        title: const Text(
          'Push Your Limits',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  '🏆${todayscount.value}',
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () => counterController.increment('$count'),
                child: IOIRoundedContainer(
                  width: 300,
                  height: 300,
                  radius: 150,
                  child: Container(
                    height: 300,
                    width: 300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      image: DecorationImage(
                        image: AssetImage('assets/violet.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            softWrap: true,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            pushupQuotes[Random().nextInt(pushupQuotes.length)],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Stack(
                            children: [
                              const Text(
                                '+1',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Positioned.fill(
                                child: Obx(
                                  () =>
                                      counterController.showAnimation.value
                                          ? FlyingNumberAnimation()
                                          : SizedBox.shrink(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Obx(
                () => Text(
                  'Record Count🔥: ${maxCount.value}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlyingNumberAnimation extends StatelessWidget {
  const FlyingNumberAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -0.5)),
      duration: Duration(milliseconds: 800),
      builder: (context, Offset offset, child) {
        return Transform.translate(
          offset: offset * MediaQuery.of(context).size.height,
          child: Opacity(
            opacity: 1 - (offset.dy.abs() * 2),
            child: Center(
              child: Text(
                "1",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
