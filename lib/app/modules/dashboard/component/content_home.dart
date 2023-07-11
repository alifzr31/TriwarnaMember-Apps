import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/modules/dashboard/component/carousel.dart';
import 'package:member_apps/app/modules/dashboard/component/widgets/shopping_content.dart';
import 'package:member_apps/app/modules/dashboard/component/widgets/todayevent_content.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';

class ContentHome extends StatelessWidget {
  ContentHome({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.token.value == 'null'
          ? noLoginContent()
          : hasLoginContent(),
    );
  }

  Widget noLoginContent() {
    return Column(
      children: [
        const TodayEventContent(),
        const SizedBox(height: 20),
        SizedBox(
          height: 200,
          width: Get.width,
          child: const CarouselField(),
        ),
      ],
    );
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
