import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PointText(
                text: 'Tracking',
                size: 18,
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
                                    color: yellow,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.tracking.length,
                          itemBuilder: (context, index) {
                            final tracking = controller.tracking[index];
                            final formatter = DateFormat('dd-MMM-yyyy');
                            var date;
                            
                            if (controller.tracking.length > 0) {
                              if (tracking.date != null) {
                                date = formatter.format(tracking.date!);
                              }
                            }

                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    iconTracking[index],
                                    height: 30,
                                    width: 30,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PointText(
                                            text: date == null
                                                ? '00-00-0000'
                                                : date),
                                        PointText(
                                            text: tracking.status.toString()),
                                        if (tracking.process == '4')
                                          Column(
                                            children: [
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.to(
                                                        ViewReceipt(
                                                            title: 'VIEW IMAGE',
                                                            image: ApiUrl
                                                                    .receiptImage +
                                                                controller.image
                                                                    .value),
                                                      );
                                                    },
                                                    child: const Text(
                                                      'View Image',
                                                      style: TextStyle(
                                                          color: Colors.blue),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 15),
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
                                                      'View Receipt',
                                                      style: TextStyle(
                                                          color: Colors.blue),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
