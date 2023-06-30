import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/circle_menu.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/component/content_home.dart';
import 'package:member_apps/app/modules/dashboard/component/header_home.dart';
import 'package:member_apps/app/modules/dashboard/component/menu_button.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:member_apps/app/modules/shopping/controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  HomeBody({super.key});
  final controller = Get.find<DashboardController>();
  final shoppingController = Get.find<ShoppingController>();

  Future<void> refreshHome() async {
    await Future.delayed(
      const Duration(milliseconds: 2500),
      () async {
        controller.fetchProfile();
        shoppingController.fetchShopping();
        controller.user.refresh();
        shoppingController.shopping.refresh();

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
    if (controller.token.value == 'null') {
      return SingleChildScrollView(
        child: Column(
          children: [
            HeaderHome(),
            const MenuButton(),
            ContentHome(),
          ],
        ),
      );
    } else {
      return LiquidPullToRefresh(
        onRefresh: refreshHome,
        color: baseColor,
        showChildOpacityTransition: false,
        backgroundColor: yellow,
        springAnimationDurationInMilliseconds: 300,
        height: 80,
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderHome(),
              const MenuButton(),
              ContentHome(),
            ],
          ),
        ),
      );
    }
  }
}
