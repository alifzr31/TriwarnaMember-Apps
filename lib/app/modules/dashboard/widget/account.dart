import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/component/white_text.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                        ? const Center(
                            child: CircularProgressIndicator(color: yellow))
                        : Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(
                                        ApiUrl.profileStorage +
                                            '/${controller.user.value!.image}'),
                                  ),
                                  SizedBox(width: Get.width * 0.07),
                                  controller.user.value!.loyalty == 'Silver'
                                      ? Image.asset('assets/images/silver.png',
                                          height: 50)
                                      : controller.user.value!.loyalty ==
                                              'Platinum'
                                          ? Image.asset(
                                              'assets/images/platinum.png',
                                              height: 50)
                                          : Image.asset(
                                              'assets/images/gold.png',
                                              height: 50),
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
                                        controller.user.value!.loyalty ==
                                                'Silver'
                                            ? Container(
                                                height: 23,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: const Center(
                                                    child: Text('Silver')),
                                              )
                                            : controller.user.value!.loyalty ==
                                                    'Platinum'
                                                ? Container(
                                                    height: 23,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: const Center(
                                                        child:
                                                            Text('Platinum')),
                                                  )
                                                : Container(
                                                    height: 23,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.amber.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: const Center(
                                                        child: Text('Gold')),
                                                  ),
                                      ],
                                    ),
                                  ),
                                ],
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
                                          WhiteText(
                                              text: controller
                                                  .user.value!.noMember!),
                                          const SizedBox(height: 10),
                                          const WhiteText(text: 'Address'),
                                          WhiteText(
                                              text: controller.user.value!
                                                  .fullAddress!.capitalize!),
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
                                            WhiteText(
                                                text: controller
                                                    .user.value!.username!),
                                            const SizedBox(height: 10),
                                            const WhiteText(text: 'Contact'),
                                            WhiteText(
                                                text: controller
                                                    .user.value!.contact!),
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

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.user.value == null
          ? Container()
          : Column(
              children: [
                ListTile(
                  leading: Image.asset('assets/images/point_icon_small.png'),
                  title: const Text('Point'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Get.toNamed(
                      '/point',
                      arguments: [
                        controller.user.value!.loyalty!.capitalize!,
                        controller.user.value!.spendingTotal!,
                      ],
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Bootstrap.door_open_fill,
                    color: Colors.black,
                  ),
                  title: const Text('Log Out'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.clear();
                    await prefs.setBool('opened', true);

                    Get.offAllNamed('/dashboard0');
                  },
                ),
              ],
            ),
    );
  }
}
