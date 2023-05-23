import 'package:get/get.dart';
import 'package:member_apps/app/data/providers/profile_provider.dart';
import 'package:member_apps/app/modules/change_pass/controller.dart';

class ChangePassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileProvider>(() => ProfileProvider());
    Get.lazyPut<ChangePassController>(() => ChangePassController(profileProvider: Get.find()));
  }
}