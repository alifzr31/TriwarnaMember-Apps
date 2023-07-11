import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_alert.dart';
import 'package:member_apps/app/component/base_button.dart';
import 'package:member_apps/app/component/yellow_button.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:member_apps/app/core/utils/gradient_color.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/component/carousel.dart';
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

  final gradient = [
    GradientColor.silver,
    GradientColor.gold,
    GradientColor.platinum,
  ];

  final tier = [
    'Silver',
    'Gold',
    'Platinum',
  ];

  int currentIndex = 0;

  Widget noLoginHeader() {
    return StatefulBuilder(
      builder: (context, setState) {
        return FadeAnimation(
          delay: 1,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Container(
                  width: Get.width,
                  height: 180,
                  child: Swiper(
                    curve: Curves.easeInOut,
                    loop: false,
                    index: currentIndex,
                    onIndexChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemCount: gradient.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          gradient: gradient[index],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: FadeAnimation(
                          delay: 1.3,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Join With Us!',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Be a member to get some benefits.',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    BaseButton(
                                      text: 'Join now',
                                      onPressed: () {
                                        Get.toNamed('/login');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${tier[index]}\nMember',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/images/logo.png',
                                    width: 85,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(gradient.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: currentIndex == index ? 12 : 8,
                    width: currentIndex == index ? 12 : 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == index ? baseColor : yellow,
                      // gradient: currentIndex == index
                      //     ? gradient[index]
                      //     : LinearGradient(
                      //         colors: [
                      //           Colors.grey.withOpacity(0.5),
                      //           Colors.grey.withOpacity(0.5),
                      //         ],
                      //         begin: Alignment.bottomLeft,
                      //         end: Alignment.topRight,
                      //       ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget hasLoginHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      child: FadeAnimation(
        delay: 1,
        child: Container(
          width: Get.width,
          height: 180,
          decoration: BoxDecoration(
            gradient: controller.user.value?.loyalty.toString().capitalize ==
                    'Silver'
                ? GradientColor.silver
                : controller.user.value?.loyalty.toString().capitalize == 'Gold'
                    ? GradientColor.gold
                    : GradientColor.platinum,
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
                                  controller.user.value!.noMember.toString(),
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
                                    SvgPicture.asset(
                                        'assets/images/point_icon.svg',
                                        width: 18),
                                    controller.user.value == null
                                        ? const CupertinoActivityIndicator()
                                        : Text(
                                            controller.user.value!.loyaltyPoint
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 16),
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
                              height: 250,
                              gradient: controller.user.value?.loyalty
                                          .toString()
                                          .capitalize ==
                                      'Silver'
                                  ? GradientColor.silver
                                  : controller.user.value?.loyalty
                                              .toString()
                                              .capitalize ==
                                          'Gold'
                                      ? GradientColor.gold
                                      : GradientColor.platinum,
                              content: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'My QR Code',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Flexible(
                                      child: Image.network(
                                        ApiUrl.qrStorage +
                                            '/${controller.user.value!.noMember}.png',
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Text(
                                              'Load image failed');
                                        },
                                      ),
                                    ),
                                    Text(controller.user.value!.noMember
                                        .toString()),
                                    Text(controller.user.value!.contact
                                        .toString()),
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
    );
  }
}
