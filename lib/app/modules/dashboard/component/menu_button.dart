import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/circle_menu.dart';
import 'package:member_apps/app/component/point_text..dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          FadeAnimation(
            delay: 1,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Check Here',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleMenu(
                svgIcon: 'member_circle.svg',
                sizeIcon: 35,
                label: 'Member',
                onTap: () async {
                  Get.toNamed('/membermenu');
                },
              ),
              CircleMenu(
                svgIcon: 'event_circle.svg',
                sizeIcon: 28,
                label: 'Event',
                onTap: () async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  final token = sharedPreferences.getString('token');
                  if (token == null) {
                    infoSnackbar(
                      "You're not logged in",
                      'You must log in first to access this feature',
                    );
                    Get.toNamed('/login');
                  } else {
                    Get.toNamed('/event');
                  }
                },
              ),
              CircleMenu(
                svgIcon: 'promo_circle.svg',
                sizeIcon: 32,
                label: 'Promo',
                onTap: () async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  final token = sharedPreferences.getString('token');
                  if (token == null) {
                    infoSnackbar(
                      "You're not logged in",
                      'You must log in first to access this feature',
                    );
                    Get.toNamed('/login');
                  } else {
                    Get.toNamed('/promo');
                  }
                },
              ),
              CircleMenu(
                svgIcon: 'ongkir_circle.svg',
                sizeIcon: 40,
                label: 'Free\nShipping',
                onTap: () {
                  _showBottomSheet(
                    'free_shipping.svg',
                    'Free Shipping',
                    'Free shipping with the provision of maximum shipping distance according to Triwarna management policy.',
                  );
                },
              ),
              CircleMenu(
                svgIcon: 'konsul_circle.svg',
                sizeIcon: 40,
                label: 'Free\nConsult',
                onTap: () {
                  _showBottomSheet(
                    'free_consult.svg',
                    'Free Consult',
                    'Free consultation with Triwarna consultants regarding the selection of colors and types of paint according to customer needs.',
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _showBottomSheet(String svgAsset, String title, String desc) async {
  await Get.bottomSheet(
    elevation: 5,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/$svgAsset',
              width: 80,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: baseColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            PointText(
              text: desc,
              bold: FontWeight.bold,
              textAlign: TextAlign.center,
              size: 16,
            ),
          ],
        ),
      ),
    ),
  );
}
