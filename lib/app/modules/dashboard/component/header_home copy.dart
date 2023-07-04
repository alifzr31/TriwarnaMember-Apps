import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_alert.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';

class HeaderHome extends StatelessWidget {
  HeaderHome({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.token.value == 'null'
          ? noLoginHeader()
          : hasLoginHeader(context),
    );
  }

  Widget noLoginHeader() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          FadeAnimation(
            delay: 1,
            child: const Text(
              "You're not logged in",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 1,
            child: InkWell(
              onTap: () {
                Get.toNamed('/login');
              },
              child: Container(
                width: Get.width,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: FadeAnimation(
                  delay: 1.3,
                  child: Center(
                    child: const Text(
                      'Tap here to log in',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget hasLoginHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // FadeAnimation(
          //   delay: 1,
          //   child: const Text(
          //     'Your Point',
          //     style: TextStyle(fontSize: 18),
          //   ),
          // ),
          // FadeAnimation(
          //   delay: 1.3,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Image.asset(
          //         'assets/images/point_icon_large.png',
          //         height: 25,
          //       ),
          //       controller.user.value == null
          //           ? CupertinoActivityIndicator()
          //           : Text(
          //               controller.user.value!.loyaltyPoint.toString(),
          //               style: const TextStyle(fontSize: 26),
          //             ),
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 10),
          FadeAnimation(
            delay: 1,
            child: Container(
              width: Get.width,
              height: 180,
              decoration: BoxDecoration(
                color: controller.user.value?.loyalty.toString().capitalize ==
                        'Silver'
                    ? Colors.grey.shade300.withOpacity(0.8)
                    : controller.user.value?.loyalty.toString().capitalize ==
                            'Gold'
                        ? gold.withOpacity(0.8)
                        : Colors.grey.shade400.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: FadeAnimation(
                delay: 1.3,
                child: controller.user.value == null
                    ? Center(
                        child: SpinKitWave(
                          size: 20,
                          itemBuilder: (BuildContext context, int index) {
                            return const DecoratedBox(
                              decoration: BoxDecoration(
                                color: baseColor,
                              ),
                            );
                          },
                        ),
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('ID Member'),
                                    Text(
                                      controller.user.value!.noMember
                                          .toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.user.value!.name
                                          .toString()
                                          .capitalize!,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/point_icon_large.png',
                                          height: 18,
                                        ),
                                        controller.user.value == null
                                            ? CupertinoActivityIndicator()
                                            : Text(
                                                controller
                                                    .user.value!.loyaltyPoint
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                      ],
                                    ),
                                    Text(
                                      '${controller.user.value!.loyalty} MEMBER',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.dialog(
                                BaseAlert(
                                  title: 'My QR Code',
                                  height: 200,
                                  content: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          ApiUrl.qrStorage +
                                              '/${controller.user.value!.noMember}.png',
                                          colorBlendMode: BlendMode.difference,
                                          errorBuilder: (context, error, stackTrace) {
                                            return const Text('Load image failed');
                                          },
                                        ),
                                        Text(controller.user.value!.noMember.toString()),
                                        Text(controller.user.value!.contact.toString()),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Image.network(
                              ApiUrl.qrStorage +
                                  '/${controller.user.value!.noMember}.png',
                              colorBlendMode: BlendMode.difference,
                              errorBuilder: (context, error, stackTrace) {
                                return const Text('Load image failed');
                              },
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
