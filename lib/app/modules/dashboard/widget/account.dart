import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/white_text.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:member_apps/app/core/utils/gradient_color.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/auth/controller.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderAccount(),
            BodyAccount(),
          ],
        ),
      ),
    );
  }
}

class HeaderAccount extends StatelessWidget {
  HeaderAccount({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipperOne(flip: true),
          child: Container(
            height: 420,
            color: yellow,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 10,
          child: ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              padding: const EdgeInsets.all(10),
              color: baseColor,
              child: SafeArea(
                child: Obx(
                  () {
                    return controller.user.value == null
                        ? Center(
                            child: SpinKitWave(
                              size: 20,
                              itemBuilder: (BuildContext context, int index) {
                                return const DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: yellow,
                                  ),
                                );
                              },
                            ),
                          )
                        : Column(
                            children: [
                              FadeAnimation(
                                delay: 1,
                                child: Row(
                                  children: [
                                    controller.user.value!.image == null
                                        ? const CircleAvatar(
                                            radius: 50,
                                            backgroundColor: yellow,
                                            child: Icon(
                                              Icons.person,
                                              size: 60,
                                              color: baseColor,
                                            ),
                                          )
                                        : CircleAvatar(
                                            radius: 50,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: NetworkImage(ApiUrl
                                                    .profileStorage +
                                                '/${controller.user.value!.image}'),
                                          ),
                                    SizedBox(width: Get.width * 0.04),
                                    SvgPicture.asset(
                                      controller.user.value!.loyalty
                                                  .toString()
                                                  .capitalize ==
                                              'Silver'
                                          ? 'assets/images/silver.svg'
                                          : controller.user.value!.loyalty
                                                      .toString()
                                                      .capitalize ==
                                                  'Gold'
                                              ? 'assets/images/gold.svg'
                                              : 'assets/images/platinum.svg',
                                      height: 50,
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                .user.value!.name!.capitalize!,
                                            style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(height: 5),
                                          controller.user.value!.loyalty
                                                      .toString()
                                                      .capitalize ==
                                                  'Silver'
                                              ? Container(
                                                  height: 23,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    gradient:
                                                        GradientColor.silver,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: const Center(
                                                      child: Text('Silver')),
                                                )
                                              : controller.user.value!.loyalty
                                                          .toString()
                                                          .capitalize ==
                                                      'Platinum'
                                                  ? Container(
                                                      height: 23,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                        gradient: GradientColor
                                                            .platinum,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      child: const Center(
                                                          child:
                                                              Text('Platinum')),
                                                    )
                                                  : Container(
                                                      height: 23,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            GradientColor.gold,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      child: const Center(
                                                          child: Text('Gold')),
                                                    ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                height: 145,
                                width: Get.width,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const WhiteText(text: 'No Member'),
                                          FadeAnimation(
                                            delay: 1.2,
                                            child: WhiteText(
                                                text: controller
                                                    .user.value!.noMember!),
                                          ),
                                          const SizedBox(height: 10),
                                          const WhiteText(text: 'Address'),
                                          FadeAnimation(
                                            delay: 1.2,
                                            child: WhiteText(
                                              text: controller.user.value!
                                                          .address ==
                                                      null
                                                  ? '-'
                                                  : controller.user.value!
                                                      .fullAddress!.capitalize!,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Flexible(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const WhiteText(text: 'Username'),
                                            FadeAnimation(
                                              delay: 1.2,
                                              child: WhiteText(
                                                  text: controller
                                                      .user.value!.username!
                                                      .toLowerCase()),
                                            ),
                                            const SizedBox(height: 10),
                                            const WhiteText(text: 'Contact'),
                                            FadeAnimation(
                                              delay: 1.2,
                                              child: WhiteText(
                                                  text: controller
                                                      .user.value!.contact!),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  height: 25,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed('/profile');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      backgroundColor: yellow,
                                      foregroundColor: baseColor,
                                    ),
                                    child: const Text('Edit Profile'),
                                  ),
                                ),
                              ),
                            ],
                          );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BodyAccount extends StatelessWidget {
  BodyAccount({super.key});
  final controller = Get.find<DashboardController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => controller.user.value == null
              ? Container()
              : Column(
                  children: [
                    FadeAnimation(
                      delay: 1,
                      child: ListTile(
                        leading:
                            SvgPicture.asset('assets/images/point_icon.svg', width: 25),
                        title: const Text('Point'),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Get.toNamed('/point');
                        },
                      ),
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: ListTile(
                        leading: SvgPicture.asset(
                          'assets/images/icon_voucher.svg',
                          width: 25,
                        ),
                        title: const Text('Your Voucher'),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Get.toNamed('/voucher');
                        },
                      ),
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: ListTile(
                        leading: SvgPicture.asset(
                          'assets/images/shopping_icon.svg',
                          width: 25,
                        ),
                        title: const Text('Shopping History'),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Get.toNamed('/shopping');
                        },
                      ),
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: ListTile(
                        leading: const Icon(
                          Iconsax.password_check,
                          color: baseColor,
                        ),
                        title: Text(controller.user.value!.pin == null
                            ? 'Create a New PIN'
                            : 'Change PIN'),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          controller.user.value!.pin == null
                              ? Get.toNamed('/createpin')
                              : Get.toNamed('/changepin');
                        },
                      ),
                    ),
                  ],
                ),
        ),
        FadeAnimation(
          delay: 1,
          child: ListTile(
            leading: const Icon(
              Iconsax.key,
              color: baseColor,
            ),
            title: const Text('Change Password'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Get.toNamed('/changepass');
            },
          ),
        ),
        FadeAnimation(
          delay: 1,
          child: ListTile(
            leading: const Icon(
              Bootstrap.door_open_fill,
              color: baseColor,
            ),
            title: const Text('Log Out'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () async {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.topSlide,
                dismissOnTouchOutside: true,
                dismissOnBackKeyPress: false,
                headerAnimationLoop: true,
                btnCancel: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: yellow,
                    foregroundColor: baseColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
                btnOkColor: baseColor,
                btnOk: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: baseColor,
                    foregroundColor: yellow,
                  ),
                  onPressed: () async {
                    authController.logout(context);
                  },
                  child: const Text('Okay'),
                ),
                padding: const EdgeInsets.all(10),
                title: 'Are you sure?',
                desc: 'Are you sure want to log out?',
              ).show();
            },
          ),
        ),
      ],
    );
  }
}
