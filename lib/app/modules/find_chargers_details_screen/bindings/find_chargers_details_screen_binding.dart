import 'package:get/get.dart';

import '../controllers/find_chargers_details_screen_controller.dart';

class FindChargersDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindChargersDetailsScreenController>(
      () => FindChargersDetailsScreenController(),
    );
  }
}
