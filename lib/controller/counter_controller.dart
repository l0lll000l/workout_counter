import 'package:counter_13/fullscreen_loader.dart';
import 'package:counter_13/storage.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  static CounterController get instance => Get.find();
  var pushcount1 = 0.obs;
  var pushcount2 = 0.obs;
  var pushcount3 = 0.obs;
  var pullcount1 = 0.obs;
  var pullcount2 = 0.obs;
  var pullcount3 = 0.obs;

  var push1maxPastCount = 0.obs;
  var push2maxPastCount = 0.obs;
  var push3maxPastCount = 0.obs;
  var pull1maxPastCount = 0.obs;
  var pull2maxPastCount = 0.obs;
  var pull3maxPastCount = 0.obs;

  var showAnimation = false.obs;
  final DBHelper _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    pushcount1.value = await _dbHelper.getTodayCount("pushcount1");
    pushcount2.value = await _dbHelper.getTodayCount("pushcount2");
    pushcount3.value = await _dbHelper.getTodayCount("pushcount3");
    pullcount1.value = await _dbHelper.getTodayCount("pullcount1");
    pullcount2.value = await _dbHelper.getTodayCount("pullcount2");
    pullcount3.value = await _dbHelper.getTodayCount("pullcount3");

    push1maxPastCount.value = await _dbHelper.getMaxPastCount("pushcount1");
    push2maxPastCount.value = await _dbHelper.getMaxPastCount("pushcount2");
    push3maxPastCount.value = await _dbHelper.getMaxPastCount("pushcount3");
    pull1maxPastCount.value = await _dbHelper.getMaxPastCount("pullcount1");
    pull2maxPastCount.value = await _dbHelper.getMaxPastCount("pullcount2");
    pull3maxPastCount.value = await _dbHelper.getMaxPastCount("pullcount3");
  }

  void increment(var count) async {
    switch (count) {
      case 'pushcount1':
        pushcount1.value++;
        if (pushcount1.value > push1maxPastCount.value) {
          push1maxPastCount.value = pushcount1.value;
          IOIfullScreenLoader.openLoadingDialog('okey');
          Future.delayed(Duration(milliseconds: 2000), () {
            IOIfullScreenLoader.stopLoading();
          });
        }
        break;

      case 'pushcount2':
        pushcount2.value++;
        if (pushcount2.value > push2maxPastCount.value) {
          push2maxPastCount.value = pushcount2.value;
          IOIfullScreenLoader.openLoadingDialog('okey');
          Future.delayed(Duration(milliseconds: 2000), () {
            IOIfullScreenLoader.stopLoading();
          });
        }

        break;

      case 'pushcount3':
        pushcount3.value++;
        if (pushcount3.value > push3maxPastCount.value) {
          push3maxPastCount.value = pushcount3.value;
          IOIfullScreenLoader.openLoadingDialog('okey');
          Future.delayed(Duration(milliseconds: 2000), () {
            IOIfullScreenLoader.stopLoading();
          });
        }
        break;

      case 'pullcount1':
        pullcount1.value++;
        if (pullcount1.value > pull1maxPastCount.value) {
          pull1maxPastCount.value = pullcount1.value;
          IOIfullScreenLoader.openLoadingDialog('okey');
          Future.delayed(Duration(milliseconds: 2000), () {
            IOIfullScreenLoader.stopLoading();
          });
        }
        break;

      case 'pullcount2':
        pullcount2.value++;
        if (pullcount2.value > pull2maxPastCount.value) {
          pull2maxPastCount.value = pullcount2.value;
          IOIfullScreenLoader.openLoadingDialog('okey');
          Future.delayed(Duration(milliseconds: 2000), () {
            IOIfullScreenLoader.stopLoading();
          });
        }
        break;

      case 'pullcount3':
        pullcount3.value++;
        if (pullcount3.value > pull3maxPastCount.value) {
          pull3maxPastCount.value = pullcount3.value;
          IOIfullScreenLoader.openLoadingDialog('okey');
          Future.delayed(Duration(milliseconds: 2000), () {
            IOIfullScreenLoader.stopLoading();
          });
        }
        break;

      default:
        print("Invalid count type");
    }
    await _dbHelper.updateCount(
      pushcount1: pushcount1.value,
      pushcount2: pushcount2.value,
      pushcount3: pushcount3.value,
      pullcount1: pullcount1.value,
      pullcount2: pullcount2.value,
      pullcount3: pullcount3.value,
    );

    // if (pushcount1.value > push1maxPastCount.value) {
    //   push1maxPastCount.value = pushcount1.value;
    //   // showNewRecordPopup();
    // }
    showAnimation.value = true;
    Future.delayed(Duration(milliseconds: 500), () {
      showAnimation.value = false;
    });
  }

  void showNewRecordPopup(count) {
    Get.defaultDialog(
      title: "New Record!",
      middleText: "You've set a new high score of $count today! 🎉",
      textConfirm: "OK",
      onConfirm: () => Get.back(),
    );
  }
}
