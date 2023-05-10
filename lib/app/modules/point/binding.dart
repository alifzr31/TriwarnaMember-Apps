import 'package:get/get.dart';
import 'package:member_apps/app/data/providers/point_provider.dart';
import 'package:member_apps/app/modules/point/controller.dart';

class PointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PointProvider>(() => PointProvider());
    Get.lazyPut<PointController>(() => PointController(pointProvider: Get.find()));
  }
}