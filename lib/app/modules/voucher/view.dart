import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_refresh.dart';
import 'package:member_apps/app/component/point_text..dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/voucher/component/voucher_card.dart';
import 'package:member_apps/app/modules/voucher/controller.dart';

class VoucherPage extends StatelessWidget {
  const VoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              FadeAnimation(
                delay: 1,
                child: Row(
                  children: [
                    Image.asset('assets/images/splash.png', width: 50),
                    const SizedBox(width: 10),
                    const Text(
                      'Your Voucher',
                      style: TextStyle(
                        fontSize: 22,
                        color: baseColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              FadeAnimation(
                delay: 1,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pick up your gift at the nearest triwarna store',
                    style: TextStyle(
                      color: baseColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListVoucher(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListVoucher extends StatelessWidget {
  ListVoucher({super.key});
  final controller = Get.find<VoucherController>();

  Future<void> refreshVoucher() async {
    await Future.delayed(
      const Duration(milliseconds: 2500),
      () async {
        controller.fetchVoucher();

        await Fluttertoast.showToast(
          msg: 'Voucher Data Refreshed',
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
    print(controller.voucher);

    return Obx(
      () => controller.isLoading.value
          ? Expanded(
              child: FadeAnimation(
                delay: 1,
                child: SpinKitWave(
                  size: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return const DecoratedBox(
                      decoration: BoxDecoration(
                        color: baseColor,
                      ),
                    );
                  },
                ),
              ),
            )
          : controller.voucher.length < 1
              ? Expanded(
                  child: Center(
                    child: FadeAnimation(
                      delay: 1.3,
                      child: SvgPicture.asset(
                        'assets/images/novoucher.svg',
                        height: 200,
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: BaseRefresh(
                    onRefresh: refreshVoucher,
                    child: ListView.builder(
                      itemCount: controller.voucher.length,
                      itemBuilder: (context, index) {
                        final voucher = controller.voucher[index];

                        return VoucherCard(
                          qrcode: '${ApiUrl.voucherStorage}/${voucher.qrcode}',
                          voucherName:
                              'VOUCHER MEMBERSHIP\n${voucher.prizeName} ${voucher.prizeDesc}',
                          onTap: () {
                            print(voucher.qrcode);
                          },
                        );
                      },
                    ),
                  ),
                ),
    );
  }
}
