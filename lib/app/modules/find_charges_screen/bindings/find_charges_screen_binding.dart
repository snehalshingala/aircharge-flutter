import 'package:get/get.dart';

import '../controllers/find_charges_screen_controller.dart';

class FindChargesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      FindChargesScreenController(),
    );
  }
}
