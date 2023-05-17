import 'package:get/get.dart';
import 'package:member_apps/app/data/providers/dashboard_provider.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';

class TarikPointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<DashboardController>(
        () => DashboardController(dashboardProvider: Get.find()));
  }
}
