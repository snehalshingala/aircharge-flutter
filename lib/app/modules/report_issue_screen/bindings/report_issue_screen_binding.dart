import 'package:get/get.dart';

import '../controllers/report_issue_screen_controller.dart';

class ReportIssueScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportIssueScreenController>(
      () => ReportIssueScreenController(),
    );
  }
}
