import 'package:aircharge/app/core/theme/buttons.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/routes/app_pages.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/find_chargers_details_screen_controller.dart';

class FindChargersDetailsScreenView
    extends GetView<FindChargersDetailsScreenController> {
  const FindChargersDetailsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 18.sp,
            color: AppColors.icongrey,
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              maxRadius: 24,
              backgroundImage: AssetImage(
                "assets/images/starbuckslogo.png",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                "Starbucks",
                style: Styles.metaRegular(
                  color: AppColors.black,
                  size: 18.sp,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.REPORT_ISSUE_SCREEN);
              },
              child: Column(
                children: [
                  Icon(
                    Icons.report_gmailerrorred,
                    size: 20.sp,
                    color: AppColors.red,
                  ),
                  Text(
                    'repot',
                    style: Styles.metaRegular(
                      color: AppColors.red,
                      size: 14.sp,
                    ),
                  )
                ],
              ),
            ),
          )
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
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Starbucks",
                  style: Styles.metaBold(
                    color: AppColors.black,
                    size: 18.sp,
                  ),
                ),
                Text(
                  "Temporarily Closed",
                  style: Styles.metaBold(
                    color: AppColors.red,
                    size: 14.sp,
                  ),
                ),
              ],
            ),
            Text(
              "150 Russell sq, Southamton Row London,WC1B 5AL, 2.4 miles",
              style: Styles.metaRegular(
                color: AppColors.icongrey,
                size: 14.sp,
              ),
              maxLines: 4,
            ),
            const Spacer(),
            Center(
              child: Text(
                "Google Review Score",
                style: Styles.metaRegular(
                  color: AppColors.icongrey,
                  size: 16.sp,
                ),
                maxLines: 4,
              ),
            ),
            Center(
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            const Spacer(),
            PrimaryButton(
                onPressed: () {},
                height: 74,
                width: Get.width,
                color: AppColors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.discount,
                      color: AppColors.grey,
                      size: 24.sp,
                    ),
                    Text(
                      " See Offers",
                      style: Styles.metaRegular(
                        color: AppColors.icongrey,
                        size: 24.sp,
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 4,
            ),
            PrimaryButton(
                onPressed: () {},
                height: 74,
                width: Get.width,
                color: AppColors.green.withOpacity(0.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      EvaIcons.navigation2,
                      color: AppColors.black.withOpacity(0.7),
                      size: 24.sp,
                    ),
                    Text(
                      " Navigate",
                      style: Styles.metaRegular(
                        color: AppColors.black,
                        size: 24.sp,
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
