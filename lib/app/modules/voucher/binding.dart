import 'package:get/get.dart';
import 'package:member_apps/app/data/providers/voucher_provider.dart';
import 'package:member_apps/app/modules/voucher/controller.dart';

class VoucherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoucherProvider>(() => VoucherProvider());
    Get.lazyPut<VoucherController>(() => VoucherController(voucherProvider: Get.find()));
  }
}