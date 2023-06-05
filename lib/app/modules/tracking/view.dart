import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:member_apps/app/modules/tracking/component/header_card.dart';
import 'package:member_apps/app/modules/tracking/component/tracking_field.dart';
import 'package:member_apps/app/modules/tracking/controller.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              FadeAnimation(
                delay: 1,
                child: Row(
                  children: [
                    Image.asset('assets/images/splash.png', width: 50),
                    const SizedBox(width: 10),
                    const Text(
                      'Tracking Your Prize',
                      style: TextStyle(
                        fontSize: 22,
                        color: baseColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              FadeAnimation(
                delay: 1,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'This page provides information on the delivery track of the gift you have selected',
                    style: TextStyle(
                      color: baseColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TrackingBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class TrackingBody extends StatelessWidget {
  TrackingBody({super.key});

  final controller = Get.find<TrackingController>();
  final userController = Get.find<DashboardController>();
  final voucherCode = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          userController.user.value == null
              ? Container()
              : HeaderCard(
                  noLoyalty: userController.user.value!.noMember.toString(),
                  voucherCode: voucherCode.toString(),
                  name: userController.user.value!.name
                      .toString()
                      .capitalize
                      .toString(),
                ),
          const SizedBox(height: 10),
          TrackingField(),
        ],
      ),
    );
  }
}
