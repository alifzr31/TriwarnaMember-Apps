import 'package:get/get.dart';
import 'package:member_apps/app/data/providers/auth_provider.dart';
import 'package:member_apps/app/data/providers/dashboard_provider.dart';
import 'package:member_apps/app/data/providers/shopping_provider.dart';
import 'package:member_apps/app/modules/auth/controller.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:member_apps/app/modules/shopping/controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<DashboardController>(() => DashboardController(dashboardProvider: Get.find()));

    Get.lazyPut<ShoppingProvider>(() => ShoppingProvider());
    Get.lazyPut<ShoppingController>(() => ShoppingController(shoppingProvider: Get.find()));
    
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<AuthController>(() => AuthController(authProvider: Get.find()));
  }
}