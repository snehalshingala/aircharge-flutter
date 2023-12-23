import 'dart:async';

import 'package:aircharge/app/modules/dashborad_scareen/views/dashborad_scareen_view.dart';
import 'package:get/get.dart';

class SplashScareenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(const Duration(seconds: 5), () {
      Get.offAll(
        // HomeView(),
        DashboradScareenView(),
      );
    });

   
    // void _startColorAnimation() {
    //   const duration =
    //       Duration(seconds: 5); // Duration for the entire animation
    //   const updateInterval = Duration(milliseconds: 100); // Update interval
    //
    //   int steps = duration.inMilliseconds ~/ updateInterval.inMilliseconds;
    //   int step = 0;
    //
    //   Timer.periodic(updateInterval, (timer) {
    //     // Calculate the color based on the current step
    //
    //
    //     // Update the UI
    //     update();
    //
    //     // Check if animation is complete
    //     if (step++ >= steps) {
    //       timer.cancel();
    //     }
    //   });
    // }
  }
}
