import 'package:aircharge/app/data/models/list_map.dart';
import 'package:get/get.dart';

class FindChargesScreenController extends GetxController {
  //TODO: Implement FindChargesScreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    charges;
  }

  // final _mapView = false.obs;
  // bool get mapView => _mapView.value;
  // set mapView(bool value) => _mapView.value = value;

  final _isMapViewVisible = false.obs;
  bool get isMapViewVisible => _isMapViewVisible.value;
  set isMapViewVisible(bool value) => _isMapViewVisible.value = value;
}
