import 'package:get/get.dart';
import 'package:member_apps/app/data/providers/auth_provider.dart';
import 'package:member_apps/app/modules/auth/controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<AuthController>(() => AuthController(authProvider: Get.find()));
  }
}