import 'package:get/get.dart';
import 'package:member_apps/app/data/providers/dashboard_provider.dart';
import 'package:member_apps/app/data/providers/input_pin_provider.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:member_apps/app/modules/input_pin/controller.dart';

class InputPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<DashboardController>(() => DashboardController(dashboardProvider: Get.find()));

    Get.lazyPut<InputPinProvider>(() => InputPinProvider());
    Get.lazyPut<InputPinController>(() => InputPinController(inputPinProvider: Get.find()));
  }
}