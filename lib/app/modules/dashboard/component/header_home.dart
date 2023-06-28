import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_alert.dart';
import 'package:member_apps/app/component/white_text.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:member_apps/app/modules/webview/view.dart';

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
    return SizedBox(
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 100,
              width: Get.width,
              decoration: const BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 80,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/login');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: yellow,
                              foregroundColor: baseColor,
                              shape: const StadiumBorder(),
                            ),
                            child: const Text('Login'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 30,
                          width: 88,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/register');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: yellow,
                              foregroundColor: baseColor,
                              shape: const StadiumBorder(),
                            ),
                            child: const Text('Register'),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Please log in first for detail information',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 20,
              width: Get.width,
              decoration: BoxDecoration(
                color: yellow,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 6,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget hasLoginHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: Get.width,
            child: Material(
              color: baseColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: controller.user.value == null
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
                    : Row(
                        children: [
                          FadeAnimation(
                            delay: 1,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  ApiUrl.profileStorage +
                                      '/${controller.user.value!.image}'),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: FadeAnimation(
                              delay: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  WhiteText(
                                    text: controller
                                        .user.value!.name!.capitalize!,
                                    size: 18,
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
                                            color: Colors.grey.shade100,
                                            borderRadius:
                                                BorderRadius.circular(30),
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
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: const Center(
                                                  child: Text('Platinum')),
                                            )
                                          : Container(
                                              height: 23,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                color: Colors.amber.shade400,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: const Center(
                                                  child: Text('Gold')),
                                            ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return BaseAlert(
                                        height: 230,
                                        title: 'My QR Code',
                                        content: Column(
                                          children: [
                                            Image.network(ApiUrl.qrStorage +
                                                '/${controller.user.value!.noMember}.png'),
                                            const SizedBox(height: 10),
                                            Flexible(
                                              child: Text(
                                                controller.user.value!.noMember
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(
                                  FontAwesome.qrcode,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              const WhiteText(text: 'QR Code')
                            ],
                          ),
                        ],
                      ),
              ),
            ),
          ),
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: yellow,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 6,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/point_icon_large.png',
                    height: 25,
                  ),
                  controller.user.value == null
                      ? const Center(child: CupertinoActivityIndicator())
                      : FadeAnimation(
                          delay: 1,
                          child: WhiteText(
                            text: controller.user.value!.loyaltyPoint!,
                            size: 16,
                          ),
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
