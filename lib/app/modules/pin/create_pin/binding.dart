import 'package:get/get.dart';
import 'package:member_apps/app/data/providers/profile_provider.dart';
import 'package:member_apps/app/modules/pin/create_pin/controller.dart';

class CreatePinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileProvider>(() => ProfileProvider());
    Get.lazyPut<CreatePinController>(() => CreatePinController(profileProvider: Get.find()));
  }
}