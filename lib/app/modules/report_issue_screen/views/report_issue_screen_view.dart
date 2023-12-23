import 'package:aircharge/app/core/theme/buttons.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/report_issue_screen_controller.dart';

class ReportIssueScreenView extends GetView<ReportIssueScreenController> {
  const ReportIssueScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Colors.grey,
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Report Issue",
            style: TextStyle(color: AppColors.black, fontSize: 18),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "It is important to us that the information in our app is accurate and up to date. ",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "We appreciate you reporting locations that may no longer have chargers available, or where they may be damaged.",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Please add any relevant detail to the comment box below.',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Costa Coffee',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  "150 Russell sq, Southamton Row London,WC1B 5AL, 2.4 miles",
                  style: TextStyle(fontSize: 16, color: AppColors.grey),
                  maxLines: 4,
                ),
                Card(
                  child: TextField(
                    controller: controller.textarea,
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: " Comment",
                      hintStyle: TextStyle(
                          fontSize: 16, color: AppColors.grey.withOpacity(0.2)),
                      // focusedBorder: OutlineInputBorder(
                      //     borderSide:
                      //         BorderSide(width: 1, color: Colors.redAccent))
                    ),
                  ),
                ),
                PrimaryButton(
                    onPressed: () {},
                    child: const Text(
                      "Report",
                      style: TextStyle(color: AppColors.black, fontSize: 20),
                    ),
                    height: 60,
                    width: Get.width,
                    color: AppColors.white),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ));
  }
}
