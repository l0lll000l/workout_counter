// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CounterController extends GetxController {
//   var count = 0.obs;
//   var showAnimation = false.obs;

//   void increment() {
//     count.value++;
//     showAnimation.value = true;
//     Future.delayed(Duration(milliseconds: 800), () {
//       showAnimation.value = false;
//     });
//   }
// }

// class CounterApp extends StatelessWidget {
//   final CounterController controller = Get.put(CounterController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Counter App")),
//       body: Stack(
//         children: [
//           Center(
//             child: Obx(
//               () => Text(
//                 "${controller.count.value}",
//                 style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           Positioned.fill(
//             child: Obx(
//               () =>
//                   controller.showAnimation.value
//                       ? FlyingNumberAnimation()
//                       : SizedBox.shrink(),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: controller.increment,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
