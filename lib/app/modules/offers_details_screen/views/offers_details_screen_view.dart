import 'package:aircharge/app/core/theme/buttons.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/offers_details_screen_controller.dart';

class OffersDetailsScreenView extends GetView<OffersDetailsScreenController> {
  const OffersDetailsScreenView({Key? key}) : super(key: key);
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
          title: const CircleAvatar(
            maxRadius: 24,
            backgroundImage: AssetImage(
              "assets/images/starbuckslogo.png",
            ),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            const Padding(
              padding: EdgeInsets.only(right: 120),
              child: Text(
                "Starbucks",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/starbucksposter.png"),
                        fit: BoxFit.fill)),
                height: Get.height / 3.2,
                width: Get.width,
              ),
              const Text(
                "Earn rewards in the starbucks loyalty app",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lightBlack),
                maxLines: 2,
              ),
              const Text(
                "Expanded offer information",
                style: TextStyle(fontSize: 16, color: AppColors.lightBlack),
              ),
              const Spacer(),
              const Text(
                'Expanded offer information',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.lightBlack,
                ),
              ),
              PrimaryButton(
                  onPressed: () {},
                  child: const Text(
                    "Redeem",
                    style: TextStyle(color: AppColors.white, fontSize: 20),
                  ),
                  height: 60,
                  width: Get.width,
                  color: AppColors.darkGreen),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}
