import 'package:get/get.dart';
import 'package:member_apps/app/data/providers/dashboard_provider.dart';
import 'package:member_apps/app/data/providers/point_provider.dart';
import 'package:member_apps/app/data/providers/prize_provider.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:member_apps/app/modules/point/additional/prize_controller.dart';
import 'package:member_apps/app/modules/point/controller.dart';

class TarikPointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<DashboardController>(
        () => DashboardController(dashboardProvider: Get.find()));

    Get.lazyPut<PointProvider>(() => PointProvider());
    Get.lazyPut<PointController>(
        () => PointController(pointProvider: Get.find()));

    Get.lazyPut<PrizeProvider>(() => PrizeProvider());
    Get.lazyPut<PrizeController>(
        () => PrizeController(prizeProvider: Get.find()));
  }
}
