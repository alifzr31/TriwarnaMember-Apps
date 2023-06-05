import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/point_text..dart';
import 'package:member_apps/app/core/value.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    Key? key,
    required this.noLoyalty,
    required this.voucherCode,
    required this.name,
  });

  final String noLoyalty;
  final String voucherCode;
  final String name;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: 1,
      child: SizedBox(
        width: Get.width,
        child: Card(
          elevation: 5,
          color: baseColor,
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Iconsax.gift,
                  color: yellow,
                  size: 80,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PointText(text: 'No. Loyalty :'),
                    PointText(text: noLoyalty),
                    const SizedBox(height: 10),
                    const PointText(text: 'Voucher Code :'),
                    PointText(text: voucherCode),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PointText(text: 'Name :'),
                      PointText(text: name),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
