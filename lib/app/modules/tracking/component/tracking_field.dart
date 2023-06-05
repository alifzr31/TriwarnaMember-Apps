import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/component/point_text..dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/tracking/component/view_receipt.dart';
import 'package:member_apps/app/modules/tracking/controller.dart';

class TrackingField extends StatefulWidget {
  const TrackingField({super.key});

  @override
  State<TrackingField> createState() => _TrackingFieldState();
}

class _TrackingFieldState extends State<TrackingField> {
  final controller = Get.find<TrackingController>();

  Future<void> refreshTracking() async {
    await Future.delayed(const Duration(milliseconds: 2500), () async {
      controller.fetchTracking();
    });
  }

  final iconTracking = [
    'assets/images/buat_voucher.svg',
    'assets/images/validasi_voucher.svg',
    'assets/images/kirim_hadiah.svg',
    'assets/images/terima_hadiah.svg',
  ];

  @override
  void initState() {
    controller.fetchTracking();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeAnimation(
        delay: 1,
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PointText(
                      text: 'Tracking',
                      size: 18,
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () {
                        final tracking = controller.tracking;

                        return controller.isLoading.value
                            ? Expanded(
                                child: Center(
                                  child: FadeAnimation(
                                    delay: 1,
                                    child: SpinKitWave(
                                      size: 30,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return const DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: yellow,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: SingleChildScrollView(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: List.generate(
                                          tracking.length,
                                          (index) => Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 30,
                                              top: 10,
                                            ),
                                            child: SvgPicture.asset(
                                              iconTracking[index],
                                              height: 24,
                                              width: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            PointText(
                                                text: tracking[0]
                                                    .date
                                                    .toString()),
                                            PointText(
                                                text: tracking[0]
                                                    .status
                                                    .toString()),
                                            const SizedBox(height: 18),
                                            tracking.length < 2
                                                ? Container()
                                                : PointText(
                                                    text: tracking[1]
                                                        .date
                                                        .toString()),
                                            tracking.length < 2
                                                ? Container()
                                                : PointText(
                                                    text: tracking[1]
                                                        .status
                                                        .toString()),
                                            const SizedBox(height: 30),
                                            tracking.length < 3
                                                ? Container()
                                                : PointText(
                                                    text: tracking[2]
                                                        .date
                                                        .toString()),
                                            tracking.length < 3
                                                ? Container()
                                                : PointText(
                                                    text: tracking[2]
                                                        .status
                                                        .toString()),
                                            const SizedBox(height: 30),
                                            tracking.length < 4
                                                ? Container()
                                                : PointText(
                                                    text: tracking[3]
                                                        .date
                                                        .toString()),
                                            tracking.length < 4
                                                ? Container()
                                                : PointText(
                                                    text: tracking[3]
                                                        .status
                                                        .toString()),
                                            const SizedBox(height: 10),
                                            tracking.length < 4
                                                ? Container()
                                                : Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.to(
                                                            ViewReceipt(
                                                                title:
                                                                    'VIEW IMAGE',
                                                                image: ApiUrl
                                                                        .receiptImage +
                                                                    controller
                                                                        .image
                                                                        .value),
                                                          );
                                                        },
                                                        child: const Text(
                                                          'View Image',
                                                          style: TextStyle(
                                                            color: Colors.blue,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 20),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.to(
                                                            ViewReceipt(
                                                                title:
                                                                    'VIEW SIGNATURE',
                                                                image: ApiUrl
                                                                        .receiptSignature +
                                                                    controller
                                                                        .signature
                                                                        .value),
                                                          );
                                                        },
                                                        child: const Text(
                                                          'View Signature',
                                                          style: TextStyle(
                                                            color: Colors.blue,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   width: Get.width,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: yellow,
              //       foregroundColor: baseColor,
              //       shape: const StadiumBorder(),
              //     ),
              //     onPressed: () {},
              //     child: const Text('I have received gift'),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}