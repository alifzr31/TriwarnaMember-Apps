import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/component/card_menu.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/component/carousel.dart';
import 'package:member_apps/app/modules/webview/view.dart';

class HomePage0 extends StatelessWidget {
  const HomePage0({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
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
                          width: 85,
                          child: ElevatedButton(
                            onPressed: () async {
                              Get.to(
                                WebViewPage(
                                  url: 'http://10.1.1.152/triwarna/register',
                                  title: 'Register Member',
                                ),
                              );
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
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
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
                    onTap: () {},
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
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          CardMenu(
            pathImage: 'assets/images/member.png',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
