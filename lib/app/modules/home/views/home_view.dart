import 'package:aircharge/app/core/constants/enums.dart';
import 'package:aircharge/app/core/theme/buttons.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/data/models/list_map.dart';
import 'package:aircharge/app/modules/home/views/offer_details.dart';
import 'package:aircharge/app/routes/app_pages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      HomeController(),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: 'air',
                style: Styles.metaRegular(
                    color: AppColors.lightBlack,
                    size: 24.sp,
                    font: FontFamily.meta),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'charge',
                style: Styles.metaBold(
                    color: AppColors.lightBlack,
                    size: 24.sp,
                    font: FontFamily.meta),
              ),
            ),
          ],
        ),
      ),
      body: const ContentWidget(),
    );
  }
}

class ContentWidget extends GetView<HomeController> {
  const ContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Text(
              'Browse Partner Offers',
              style: Styles.metaBold(
                color: AppColors.black,
                size: 18.sp,
              ),
            ),
            Text(
              "All locations shown in the list below, have wireless chargers installed on the premises.",
              textAlign: TextAlign.center,
              style: Styles.metaRegular(
                color: AppColors.grey,
                size: 12.sp,
              ),
              maxLines: 2,
            ),
            Expanded(
              child: Container(
                color: AppColors.grey.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 2.0,
                ),
                child: ListView(
                  children: [
                    CarouselSlider.builder(
                      itemCount: controller.itemsDemo.length,
                      options: CarouselOptions(
                        aspectRatio: 2.4,
                        enlargeCenterPage: true,
                        onPageChanged: controller.onPageChanged,
                        viewportFraction: 1.0,
                      ),
                      itemBuilder: (context, index, realIdx) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 6.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.sp),
                              child: Image.asset(
                                controller.itemsDemo[index],
                                fit: BoxFit.cover,
                                width: Get.width,
                              ),
                            ));
                      },
                    ),
                    Obx(() => controller
                        .buildDotIndicator(controller.currentPage.value)),
                    SizedBox(
                      height: 2.sp,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: offers.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: InkWell(
                              onTap: () {
                                controller.toggleVisibility();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.sp),
                                ),
                                width: Get.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.sp),
                                              topRight: Radius.circular(10.sp)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "${offers[index]['image']}"),
                                              fit: BoxFit.fill)),
                                      height: Get.height / 4,
                                      width: Get.width,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "${offers[index]['title']}",
                                        style: Styles.metaBold(
                                          color: AppColors.black,
                                          size: 14.sp,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "${offers[index]['subtitle']}",
                                        style: Styles.metaRegular(
                                          color: AppColors.black,
                                          size: 14.sp,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "${offers[index]['text']}",
                                        style: Styles.metaRegular(
                                          color: AppColors.black,
                                          size: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
          ],
        ),
        Obx(
          () => Positioned.fill(
            child: Visibility(
                visible: controller.showOfferDetailsPage.value,
                child: OfferDetails()),
          ),
        ),
      ],
    );
  }
}
