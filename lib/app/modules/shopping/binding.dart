import 'package:get/get.dart';
import 'package:member_apps/app/data/providers/shopping_provider.dart';
import 'package:member_apps/app/modules/shopping/controller.dart';
import 'package:member_apps/app/modules/shopping/shopping_detail/shopping_detail_controller.dart';

class ShoppingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingProvider>(() => ShoppingProvider());
    Get.lazyPut<ShoppingController>(() => ShoppingController(shoppingProvider: Get.find()));
    Get.lazyPut<ShoppingDetailController>(() => ShoppingDetailController(shoppingProvider: Get.find()));
  }
}