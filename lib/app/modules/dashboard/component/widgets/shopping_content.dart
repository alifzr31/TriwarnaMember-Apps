import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/shopping/controller.dart';

class ShoppingContent extends StatelessWidget {
  ShoppingContent({super.key});
  final shoppingController = Get.find<ShoppingController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Column(
        children: [
          FadeAnimation(
            delay: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Shopping History',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/shopping');
                  },
                  child: const Text(
                    'See More...',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => shoppingController.isLoading.value
                ? Expanded(
                    child: Center(
                      child: SpinKitWave(
                        size: 25,
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
                : shoppingController.shopping.isEmpty
                    ? Expanded(
                        child: FadeAnimation(
                          delay: 1,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/noshoppinghistory.svg',
                              width: Get.width < 390 ? 100 : 120,
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: shoppingController.shopping.length >= 3
                              ? 3
                              : shoppingController.shopping.length,
                          itemBuilder: (context, index) {
                            final shopping = shoppingController.shopping[index];

                            double ttl =
                                double.parse(shopping.total.toString());
                            int roundedUp = ttl.ceil();
                            final total = NumberFormat.currency(
                              locale: 'id_ID',
                              symbol: 'Rp ',
                            ).format(int.parse(roundedUp.toString()));

                            final formatter = DateFormat('dd-MMM-yyyy');
                            final date = formatter.format(shopping.date!);

                            return FadeAnimation(
                              delay: 1.3,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/shopping_icon.svg',
                                        height: 45,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    shopping.noStruk.toString(),
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: baseColor,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    total,
                                                    style: const TextStyle(
                                                      color: baseColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              date,
                                              style: const TextStyle(
                                                color: baseColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 1,
                                    width: Get.width,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    color: yellow,
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
    );
  }
}
