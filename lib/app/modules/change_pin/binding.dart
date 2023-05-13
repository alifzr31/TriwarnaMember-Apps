import 'package:get/get.dart';
import 'package:member_apps/app/data/providers/dashboard_provider.dart';
import 'package:member_apps/app/data/providers/profile_provider.dart';
import 'package:member_apps/app/modules/change_pin/controller.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';

class ChangePinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileProvider>(() => ProfileProvider());
    Get.lazyPut<ChangePinController>(() => ChangePinController(profileProvider: Get.find()));
    
    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<DashboardController>(() => DashboardController(dashboardProvider: Get.find()));
  }
}