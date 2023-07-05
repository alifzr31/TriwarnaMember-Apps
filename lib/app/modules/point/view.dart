import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_refresh.dart';
import 'package:member_apps/app/component/point_text..dart';
import 'package:member_apps/app/component/transparent_appbar.dart';
import 'package:member_apps/app/component/white_text.dart';
import 'package:member_apps/app/core/utils/gradient_color.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:member_apps/app/modules/point/controller.dart';
import 'package:intl/intl.dart';

class PointPage extends StatelessWidget {
  const PointPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final loyalty = Get.arguments[0];
    // final spendTotal = Get.arguments[1];

    return Scaffold(
      appBar: TransparentAppbar(
        title: '',
        preferredSize: Size.fromHeight(kToolbarHeight),
        action: [
          Center(
            child: TextButton(
              onPressed: () {
                Get.bottomSheet(
                  SizedBox(
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Bootstrap.file_text_fill,
                                color: yellow,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              WhiteText(
                                text: 'Terms & Condition',
                                size: 22,
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Expanded(
                            child: ListView(
                              physics: const ClampingScrollPhysics(),
                              children: const [
                                WhiteText(
                                    text:
                                        '1. Points that can be redeemed in increments of 50'),
                                SizedBox(height: 10),
                                WhiteText(
                                    text:
                                        '2. The balance taken cannot exceed your active points'),
                                SizedBox(height: 10),
                                WhiteText(
                                    text:
                                        '3. The time limit of the disbursed balance is 1 month'),
                                SizedBox(height: 10),
                                WhiteText(
                                    text:
                                        '4. If the balance that has been disbursed is not spent then the voucher cannot be used (Forfeited)'),
                                SizedBox(height: 10),
                                WhiteText(
                                    text:
                                        '5. Forfeited vouchers will not give you back your points'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: baseColor,
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                );
              },
              child: const Text('Terms & Condition'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              HeaderPoint(),
              const SizedBox(height: 10),
              HistorySaldo(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderPoint extends StatelessWidget {
  HeaderPoint({super.key});
  final controller = Get.find<PointController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    final spend =
        int.parse(userController.user.value!.spendingTotal.toString());
    final total_spending = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(spend);

    return Obx(
      () => Column(
        children: [
          Image.asset('assets/images/point_icon_large.png'),
          FadeAnimation(
            delay: 1,
            child: PointText(text: controller.jumlah.value, size: 34),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/tarikpoint');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: baseColor,
              shape: const StadiumBorder(),
            ),
            child: const Text('Redeem Point'),
          ),
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                userController.user.value == null
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FadeAnimation(
                            delay: 1,
                            child: WhiteText(
                              text: userController.user.value!.loyalty
                                  .toString()
                                  .capitalize!,
                              size: 16,
                              bold: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              FadeAnimation(
                                delay: 1,
                                child: WhiteText(
                                  text: total_spending,
                                  bold: FontWeight.bold,
                                ),
                              ),
                              WhiteText(
                                text: "/Rp 100.000.000,00",
                                bold: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                const SizedBox(height: 5),
                userController.user.value!.loyalty.toString().capitalize! ==
                        'Silver'
                    ? Stack(
                        children: [
                          Container(
                            height: 8,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          Container(
                            height: 8,
                            width: spend * (Get.width / 100000000),
                            decoration: BoxDecoration(
                              gradient: GradientColor.silver,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      )
                    : userController.user.value!.loyalty
                                .toString()
                                .capitalize! ==
                            'Gold'
                        ? Stack(
                            children: [
                              Container(
                                height: 8,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              Container(
                                height: 8,
                                width: spend * (Get.width / 100000000),
                                decoration: BoxDecoration(
                                  gradient: GradientColor.gold,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Stack(
                            children: [
                              Container(
                                height: 8,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              Container(
                                height: 8,
                                width: spend * (Get.width / 100000000),
                                decoration: BoxDecoration(
                                  gradient: GradientColor.platinum,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                const Divider(),
                Row(
                  children: [
                    WhiteText(
                        text: 'Last Transaction : ', bold: FontWeight.bold),
                    FadeAnimation(
                      delay: 1,
                      child: WhiteText(
                        text: controller.last_transaction.value == null
                            ? '-'
                            : controller.last_transaction.value,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HistorySaldo extends StatelessWidget {
  HistorySaldo({super.key});
  final controller = Get.find<PointController>();

  Future<void> refreshListPoint() async {
    await Future.delayed(
      const Duration(milliseconds: 2500),
      () async {
        controller.fetchPoint();
        controller.point.refresh();

        await Fluttertoast.showToast(
          msg: 'Point Data Refreshed',
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
    return Expanded(
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Iconsax.chart_1),
              SizedBox(width: 5),
              Text(
                'Point History',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(height: 10),
          Obx(
            () => controller.isLoading.value
                ? Expanded(
                    child: Center(
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
                    ),
                  )
                : controller.point.length < 1
                    ? Expanded(
                        child: Center(
                          child: FadeAnimation(
                            delay: 1.3,
                            child: SvgPicture.asset(
                              'assets/images/nopointhistory.svg',
                              height: 100,
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: BaseRefresh(
                          onRefresh: refreshListPoint,
                          child: ListView.builder(
                            itemCount: controller.point.length,
                            itemBuilder: (context, index) {
                              final formatter = DateFormat('dd/MM/yyyy');
                              final tanggal = formatter.format(
                                  controller.point[index].transactionDate);

                              return FadeAnimation(
                                delay: 1,
                                child: Card(
                                  color: Colors.transparent,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  elevation: 0,
                                  child: controller.point[index].info == '0'
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text('Point added',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(tanggal,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Text(
                                              '+' +
                                                  controller.point[index]
                                                      .addSubAmount!,
                                              style: const TextStyle(
                                                  color: Colors.green),
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                    'Remaining Points : ',
                                                    style: TextStyle(
                                                        color: baseColor)),
                                                PointText(
                                                    text: controller
                                                        .point[index]
                                                        .remainingPoint!),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            const Divider(
                                              height: 1,
                                              color: Colors.grey,
                                            )
                                          ],
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text('Point redeemed',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(tanggal,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Text(
                                              '-' +
                                                  controller.point[index]
                                                      .addSubAmount!,
                                              style: const TextStyle(
                                                  color: Colors.red),
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                    'Remaining Points : ',
                                                    style: TextStyle(
                                                        color: baseColor)),
                                                PointText(
                                                    text: controller
                                                        .point[index]
                                                        .remainingPoint!),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            const Divider(
                                              height: 1,
                                              color: Colors.grey,
                                            )
                                          ],
                                        ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
