import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/component/base_refresh.dart';
import 'package:member_apps/app/modules/dashboard/component/carousel.dart';
import 'package:member_apps/app/modules/dashboard/component/header_home.dart';
import 'package:member_apps/app/modules/dashboard/component/menu_button.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';

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
