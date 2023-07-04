import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_refresh.dart';
import 'package:member_apps/app/component/grey_text.dart';
import 'package:member_apps/app/component/white_text.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';

class LotteryPage extends StatelessWidget {
  const LotteryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              HeaderLottery(),
              BodyLottery(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderLottery extends StatelessWidget {
  HeaderLottery({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.width < 390 ? 380 : 380,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/head.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => controller.user.value == null
                ? SpinKitWave(
                    size: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return const DecoratedBox(
                        decoration: BoxDecoration(
                          color: yellow,
                        ),
                      );
                    },
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WhiteText(
                          text: 'Data Diri', bold: FontWeight.bold, size: 18),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.contacts,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 5),
                                    const WhiteText(text: 'No Member'),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                FadeAnimation(
                                  delay: 1,
                                  child: GreyText(
                                      text: controller.user.value!.noMember!),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.work,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 5),
                                    const WhiteText(text: 'Job'),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                FadeAnimation(
                                  delay: 1,
                                  child: GreyText(
                                      text: controller.user.value!.job!),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_pin,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 5),
                                    const WhiteText(text: 'Address'),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                FadeAnimation(
                                  delay: 1,
                                  child: GreyText(
                                    text: controller
                                        .user.value!.fullAddress!.capitalize!,
                                    // textAlign: TextAlign.justify,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.card_membership,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 5),
                                    const WhiteText(text: 'Loyalty Level'),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                FadeAnimation(
                                  delay: 1,
                                  child: GreyText(
                                      text: controller.user.value!.loyalty!),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.person_2_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  const WhiteText(text: 'Full Name'),
                                ],
                              ),
                              const SizedBox(height: 5),
                              FadeAnimation(
                                delay: 1,
                                child: GreyText(
                                    text: controller.user.value!.name!),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.credit_card,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  const WhiteText(text: 'ID Number'),
                                ],
                              ),
                              const SizedBox(height: 5),
                              FadeAnimation(
                                delay: 1,
                                child: GreyText(
                                    text: controller.user.value!.idNumber ?? '-'),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.phone_android,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  const WhiteText(text: 'Phone Number'),
                                ],
                              ),
                              const SizedBox(height: 5),
                              FadeAnimation(
                                delay: 1,
                                child: GreyText(
                                    text: controller.user.value!.contact!),
                              ),
                              const SizedBox(height: 50)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class BodyLottery extends StatelessWidget {
  BodyLottery({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.firstLoading.value
          ? Expanded(
              child: Center(
                child: SpinKitWave(
                  size: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return const DecoratedBox(
                      decoration: BoxDecoration(
                        color: baseColor,
                      ),
                    );
                  },
                ),
              ),
            )
          : controller.lottery.length < 1
              ? Expanded(
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/lotterynotfound.svg',
                      width: Get.width < 390 ? 200 : 230,
                    ),
                  ),
                )
              : Expanded(
                  child: BaseRefresh(
                    onRefresh: controller.refreshLottery,
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      controller: controller.scrollController,
                      itemCount: controller.lottery.length + 1,
                      itemBuilder: (context, index) {
                        if (index < controller.lottery.length) {
                          final lottery = controller.lottery[index];
                          final formatter = DateFormat('dd-MMM-yyyy');
                          final tanggal = formatter.format(lottery.tanggal!);

                          return FadeAnimation(
                            delay: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/tiket.svg',
                                        width: 80,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    lottery.noUndian.toString(),
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: baseColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    lottery.no.toString(),
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      color: baseColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              tanggal,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: baseColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    color: yellow,
                                    width: Get.width,
                                    height: 2,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          if (controller.hasMore.value) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Center(
                                child: SpinKitWave(
                                  size: 20,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: baseColor,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
                ),
    );
  }
}
