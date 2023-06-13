import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_alert.dart';
import 'package:member_apps/app/component/base_refresh.dart';
import 'package:member_apps/app/component/card_menu.dart';
import 'package:member_apps/app/component/white_text.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/component/carousel.dart';
import 'package:member_apps/app/modules/dashboard/component/header_home.dart';
import 'package:member_apps/app/modules/dashboard/component/menu_button.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:member_apps/app/modules/webview/view.dart';

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
      child: controller.token.value == 'null'
          ? SingleChildScrollView(
              child: Column(
                children: [
                  HeaderHome(),
                  const SizedBox(height: 10),
                  const MenuButton(),
                  SizedBox(
                    height: 200,
                    width: Get.width,
                    child: CarouselField(),
                  ),
                ],
              ),
            )
          : BaseRefresh(
              onRefresh: refreshHome,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeaderHome(),
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
