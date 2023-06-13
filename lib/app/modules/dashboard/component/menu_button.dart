import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/component/card_menu.dart';
import 'package:member_apps/app/component/point_text..dart';
import 'package:member_apps/app/core/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    svgAsset: 'assets/images/event.svg',
                    onTap: () async {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      final token = sharedPreferences.getString('token');
                      if (token == null) {
                        Get.snackbar(
                          "You're not logged in",
                          'You must log in first to access this feature',
                          backgroundColor: Colors.blue.withOpacity(0.8),
                          colorText: Colors.white,
                          icon: const Icon(
                            Iconsax.info_circle,
                            size: 30,
                            color: Colors.white,
                          ),
                        );
                        Get.toNamed('/login');
                      } else {
                        Get.toNamed('/event');
                      }
                    },
                  ),
                  CardMenu(
                    svgAsset: 'assets/images/konsul.svg',
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
              Column(
                children: [
                  CardMenu(
                    svgAsset: 'assets/images/promo.svg',
                    onTap: () async {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      final token = sharedPreferences.getString('token');
                      if (token == null) {
                        Get.snackbar(
                          "You're not logged in",
                          'You must log in first to access this feature',
                          backgroundColor: Colors.blue.withOpacity(0.8),
                          colorText: Colors.white,
                          icon: const Icon(
                            Iconsax.info_circle,
                            size: 30,
                            color: Colors.white,
                          ),
                        );
                        Get.toNamed('/login');
                      } else {
                        Get.toNamed('/promo');
                      }
                    },
                  ),
                  CardMenu(
                    svgAsset: 'assets/images/ongkir.svg',
                    onTap: () {
                      _showBottomSheet(
                        'free_shipping.svg',
                        'Free Shipping',
                        'Free shipping with the provision of maximum shipping distance according to Triwarna management policy.',
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          CardMenu(
            svgAsset: 'assets/images/member.svg',
            onTap: () {
              Get.toNamed('/membermenu');
            },
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
