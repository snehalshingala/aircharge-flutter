import 'package:aircharge/app/core/theme/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashborad_scareen_controller.dart';

class DashboradScareenView extends GetView<DashboradScareenController> {
  const DashboradScareenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DashboradScareenController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: DashbordBottomNavigationBar(),
      body: GetBuilder<DashboradScareenController>(
        id: "screen",
        builder: (cont) => Stack(
          children: [
            cont.currentScreen,
          ],
        ),
      ),
    );
  }
}

class DashbordBottomNavigationBar extends StatelessWidget {
  DashbordBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey.withOpacity(0.1),
      // margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.only(top: 8.0),
      height: 80,
      child: GetBuilder<DashboradScareenController>(
          id: "screen",
          builder: (cont) => BottomNavigationBar(
                selectedItemColor: AppColors.black,
                onTap: cont.navigateToScreen,
                currentIndex: cont.currentIndex,
                backgroundColor: AppColors.white,
                unselectedItemColor: AppColors.grey,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.discount_outlined),
                    label: 'Offers',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(EvaIcons.flash),
                    label: 'Find Chargers',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
              )),
    );
  }
}
