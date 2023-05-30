import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/point_text..dart';

import '../../../core/value.dart';

class VoucherCard extends StatelessWidget {
  const VoucherCard({
    Key? key,
    required this.qrcode,
    required this.voucherName,
    this.onTap,
  }) : super(key: key);

  final String qrcode;
  final String voucherName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: 1.3,
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.only(bottom: 10),
        color: baseColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: Get.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/images/logovoucher.svg'),
                const SizedBox(width: 5),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5, top: 10, bottom: 10, right: 10),
                    child: FadeAnimation(
                      delay: 1.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const PointText(text: 'Triwarna Loyalty Voucher'),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Image.network(
                                qrcode,
                                width: 70,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: PointText(
                                  text: voucherName,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
