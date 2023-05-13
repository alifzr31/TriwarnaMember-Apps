import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/component/card_menu.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/component/carousel.dart';
import 'package:smart_alert_dialog/models/alert_dialog_text.dart';
import 'package:smart_alert_dialog/smart_alert_dialog.dart';

class HomePage0 extends StatelessWidget {
  const HomePage0({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: 10),
              const MenuButton(),
              SizedBox(
                height: 200,
                width: Get.width,
                child: CarouselField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
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
                        width: 85,
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
                    'Please login first for detail information',
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
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                CardMenu(
                  pathImage: 'assets/images/event.png',
                  onTap: () {
                    Get.toNamed('/event');
                  },
                ),
                CardMenu(
                  pathImage: 'assets/images/konsul.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => SmartAlertDialog(
                        title: "You are not logged in",
                        message: "Please login first to enjoy this feature.",
                        text: AlertDialogText(),
                        onConfirmPressed: () {
                          Get.toNamed('/login');
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            Column(
              children: [
                CardMenu(
                  pathImage: 'assets/images/promo.png',
                  onTap: () {
                    Get.toNamed('/promo');
                  },
                ),
                CardMenu(
                  pathImage: 'assets/images/ongkir.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => SmartAlertDialog(
                        title: "You are not logged in",
                        message: "Please login first to enjoy this feature.",
                        text: AlertDialogText(),
                        onConfirmPressed: () {
                          Get.toNamed('/login');
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        CardMenu(
          pathImage: 'assets/images/member.png',
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => SmartAlertDialog(
                title: "You are not logged in",
                message: "Please login first to enjoy this feature.",
                text: AlertDialogText(),
                onConfirmPressed: () {
                  Get.toNamed('/login');
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
