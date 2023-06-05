import 'package:get/get.dart';
import 'package:member_apps/app/data/providers/gratis_ongkir_provider.dart';
import 'package:member_apps/app/modules/gratis_ongkir/controller.dart';

class GratisOngkirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GratisOngkirProvider>(() => GratisOngkirProvider());
    Get.lazyPut<GratisOngkirController>(() => GratisOngkirController(gratisOngkirProvider: Get.find()));
  }
}