import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_refresh.dart';
import 'package:member_apps/app/component/card_menu.dart';
import 'package:member_apps/app/component/white_text.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/component/carousel.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<DashboardController>();

  Future<void> refreshHome() async {
    await Future.delayed(
      const Duration(milliseconds: 2500),
      () async {
        controller.fetchProfile();
        controller.user.refresh();

        await Fluttertoast.showToast(
          msg: 'Data Refreshed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.8),
          textColor: Colors.white,
          fontSize: 12.0,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BaseRefresh(
        onRefresh: refreshHome,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Header(),
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
      ),
    );
  }
}

class Header extends StatelessWidget {
  Header({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
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
                                    text:
                                        controller.user.value!.name!.capitalize!,
                                    size: 18,
                                  ),
                                  const SizedBox(height: 5),
                                  controller.user.value!.loyalty == 'Silver'
                                      ? Container(
                                          height: 23,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child:
                                              const Center(child: Text('Silver')),
                                        )
                                      : controller.user.value!.loyalty ==
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
                                  print('My QR Code');
                                },
                                icon: Icon(
                                  FontAwesomeIcons.qrcode,
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
    );
  }
}