import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/modules/dashboard/component/widgets/shopping_content.dart';
import 'package:member_apps/app/modules/dashboard/component/widgets/todayevent_content.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';

class ContentHome extends StatelessWidget {
  ContentHome({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Obx(
        () => controller.token.value == 'null'
            ? noLoginContent()
            : hasLoginContent(),
      ),
    );
  }

  Widget noLoginContent() {
    return const TodayEventContent();
  }

  Widget hasLoginContent() {
    return Column(
      children: [
        ShoppingContent(),
        const SizedBox(height: 10),
        const TodayEventContent(),
      ],
    );
  }
}
