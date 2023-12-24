import 'package:aircharge/app/core/constants/enums.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/data/models/list_map.dart';
import 'package:aircharge/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/find_charges_screen_controller.dart';

class FindChargesScreenView extends GetView<FindChargesScreenController> {
  const FindChargesScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(FindChargesScreenController());
    GoogleMapController? mapController;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: TextFormField(
                obscureText: true,
                autofocus: false,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.darkGrey,
                    ),
                    hintText: 'Search Public Charging Locatins',
                    helperStyle: const TextStyle(color: AppColors.grey),
                    fillColor: AppColors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 3.0))),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Card(
                  child: Container(
                    // padding: const EdgeInsets.all(8),
                    height: 50,
                    width: Get.width / 2.24,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: Row(children: [
                      const Icon(
                        Icons.emergency_share_rounded,
                        color: AppColors.green,
                      ),
                      Flexible(
                        child: Text(
                          'Current Location',
                          style: Styles.metaRegular(
                            color: AppColors.icongrey,
                            size: 18.sp,
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    width: Get.width / 2.24,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: Obx(() => InkWell(
                          onTap: () {
                            controller.isMapViewVisible =
                                !controller.isMapViewVisible;
                          },
                          child: Row(children: [
                            Icon(
                              controller.isMapViewVisible
                                  ? Icons.map
                                  : Icons.list_outlined,
                              color: AppColors.darkGrey,
                            ),
                            FittedBox(
                              child: Text(
                                // "",
                                controller.isMapViewVisible
                                    ? ' Map View'
                                    : " List View",
                                style: Styles.metaRegular(
                                  color: AppColors.icongrey,
                                  size: 18.sp,
                                ),
                              ),
                            )
                          ]),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 500,
            width: 400,
            child: Obx(() => Visibility(
                  visible: controller.isMapViewVisible,
                  replacement: listViewWidget(),
                  child: Stack(
                    children: [
                      GoogleMap(
                        onMapCreated: (controller) {
                          mapController = controller;
                        },
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(
                              37.7749, -122.4194), // Set initial location
                          zoom: 8.0,
                        ),
                      ),
                      Column(
                        children: [
                          Expanded(flex: 10, child: Container()),
                          Expanded(
                            flex: 14,
                            child: listViewWidget(),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}

Widget listViewWidget() {
  return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      itemCount: charges.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.FIND_CHARGERS_DETAILS_SCREEN,
                  arguments: charges);
            },
            child: ListTile(
              tileColor: AppColors.white,
              leading: CircleAvatar(
                maxRadius: 30,
                backgroundImage: AssetImage("${charges[index]['image']}"),
              ),
              title: Text(
                charges[index]['title'] ?? "",
                style: Styles.metaBold(
                  color: AppColors.black,
                  size: 18.sp,
                ),
              ),
              subtitle: Text(
                // "${   charges[index]['subtitle'] \n  charges[index]['thirdtitle'] ,}",
                "Southampton row\n2.5 miles",
                style: Styles.metaRegular(
                  color: AppColors.icongrey,
                  size: 16.sp,
                ),
              ),
              isThreeLine: true,
              trailing: const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 22,
                  color: AppColors.darkGrey,
                ),
              ),
            ),
          ),
        );
      });
}
