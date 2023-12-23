import 'package:aircharge/app/core/theme/buttons.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/data/models/list_map.dart';
import 'package:aircharge/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/colors.dart';

class OfferDetails extends GetView<HomeController> {
  const OfferDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppColors.red,
      child: Container(
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            kBottomNavigationBarHeight,
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    controller.toggleVisibility();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 18.sp,
                    color: AppColors.icongrey,
                  ),
                ),
                SizedBox(
                  width: 12.sp,
                ),
                const CircleAvatar(
                  maxRadius: 24,
                  backgroundImage: AssetImage(
                    "assets/images/starbuckslogo.png",
                  ),
                ),
                SizedBox(
                  width: 36.sp,
                ),
                Text(
                  "Starbucks",
                  style: Styles.metaBold(
                    color: AppColors.black,
                    size: 18.sp,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/starbucksposter.png"),
                      fit: BoxFit.fill)),
              height: Get.height / 3.2,
              width: Get.width,
            ),
            Text(
              "Earn rewards in the starbucks loyalty app",
              style: Styles.metaBold(
                color: AppColors.black,
                size: 18.sp,
              ),
              maxLines: 2,
            ),
            Text(
              "Expanded offer information",
              style: Styles.metaRegular(
                color: AppColors.black,
                size: 16.sp,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Offer ends: dd/mm/yyyy",
              style: Styles.metaRegular(
                color: AppColors.black,
                size: 16.sp,
              ),
            ),
            PrimaryButton(
              onPressed: () {},
              height: 60.sp,
              width: Get.width,
              color: AppColors.darkGreen,
              child: Text(
                "Redeem",
                style: Styles.metaRegular(
                  color: AppColors.white,
                  size: 24.sp,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
