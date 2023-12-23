import 'package:get/get.dart';

import '../controllers/offers_details_screen_controller.dart';

class OffersDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OffersDetailsScreenController>(
      () => OffersDetailsScreenController(),
    );
  }
}
