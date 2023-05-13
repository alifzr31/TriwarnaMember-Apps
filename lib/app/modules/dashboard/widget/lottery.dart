import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
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
        child: Column(
          children: [
            HeaderLottery(),
            const SizedBox(height: 5),
            BodyLottery(),
          ],
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
    return Obx(
      () => controller.user.value == null
          ? const Center(child: CircularProgressIndicator(color: yellow))
          : Container(
              width: Get.width,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/head.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WhiteText(
                          text: 'Data Diri', bold: FontWeight.bold, size: 18),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
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
                              Row(
                                children: [
                                  const SizedBox(width: 25),
                                  FadeAnimation(
                                    delay: 1,
                                    child: GreyText(
                                        text: controller.user.value!.noMember!),
                                  ),
                                ],
                              ),
                              const Divider(),
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
                              Row(
                                children: [
                                  const SizedBox(width: 25),
                                  FadeAnimation(
                                    delay: 1,
                                    child: GreyText(
                                        text: controller.user.value!.job!),
                                  ),
                                ],
                              ),
                              const Divider(),
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
                              Row(
                                children: [
                                  const SizedBox(width: 25),
                                  FadeAnimation(
                                    delay: 1,
                                    child: GreyText(
                                        text: controller.user.value!.address!),
                                  ),
                                ],
                              ),
                              const Divider(),
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
                              Row(
                                children: [
                                  const SizedBox(width: 25),
                                  FadeAnimation(
                                    delay: 1,
                                    child: GreyText(
                                        text: controller.user.value!.loyalty!),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                              Row(
                                children: [
                                  const SizedBox(width: 25),
                                  FadeAnimation(
                                    delay: 1,
                                    child: GreyText(
                                        text: controller.user.value!.name!),
                                  ),
                                ],
                              ),
                              const Divider(),
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
                              Row(
                                children: [
                                  const SizedBox(width: 25),
                                  FadeAnimation(
                                    delay: 1,
                                    child: GreyText(
                                        text: controller.user.value!.idNumber!),
                                  ),
                                ],
                              ),
                              const Divider(),
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
                              Row(
                                children: [
                                  const SizedBox(width: 25),
                                  FadeAnimation(
                                    delay: 1,
                                    child: GreyText(
                                        text: controller.user.value!.contact!),
                                  ),
                                ],
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
  const BodyLottery({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.1),
          Image.asset('assets/images/nodata.png'),
          const SizedBox(height: 10),
          const Text(
            'Lottery Number Not Found',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
