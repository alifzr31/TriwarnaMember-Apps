import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_refresh.dart';
import 'package:member_apps/app/component/base_search_input.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/component/confirm_alert_button.dart';
import 'package:member_apps/app/component/point_text..dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:member_apps/app/modules/point/additional/prize_controller.dart';
import 'package:member_apps/app/modules/point/controller.dart';

// class TarikPointPage extends StatelessWidget {
//   const TarikPointPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: TransparentAppbar(
//         title: 'REDEEM POINT',
//         preferredSize: Size.fromHeight(kToolbarHeight),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FadeAnimation(
//               delay: 1,
//               child: const Align(
//                 alignment: Alignment.topLeft,
//                 child: Text(
//                   '*The number of Coins cannot be less than 50',
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             FormTarik(),
//           ],
//         ),
//       ),
//     );
//   }
// }

class TarikPointPage extends StatelessWidget {
  const TarikPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TransparentAppbar(
      //   title: 'REDEEM POINT',
      //   preferredSize: Size.fromHeight(kToolbarHeight),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeAnimation(
                    delay: 1,
                    child: Row(
                      children: [
                        Image.asset('assets/images/splash.png', width: 50),
                        const SizedBox(width: 10),
                        const Text(
                          'Redeem Point',
                          style: TextStyle(
                            fontSize: 22,
                            color: baseColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PointView(),
                ],
              ),
              const SizedBox(height: 10),
              FadeAnimation(
                delay: 1.3,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '*Total points cannot be less than 50',
                    style: TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 10),
              RedeemPrize(),
            ],
          ),
        ),
      ),
    );
  }
}

class PointView extends StatelessWidget {
  PointView({super.key});
  final controller = Get.find<PointController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FadeAnimation(
        delay: 1,
        child: Row(
          children: [
            Image.asset(
              'assets/images/point_icon_large.png',
              width: 40,
            ),
            FadeAnimation(
              delay: 1.3,
              child: PointText(
                text: controller.jumlah.value,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RedeemPrize extends StatelessWidget {
  RedeemPrize({super.key});
  final controller = Get.find<PrizeController>();
  final userController = Get.find<DashboardController>();

  Future<void> refreshPrize() async {
    await Future.delayed(const Duration(milliseconds: 2500), () async {
      controller.fetchPrize();

      await Fluttertoast.showToast(
        msg: 'Prize Data Refreshed',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.8),
        textColor: Colors.white,
        fontSize: 12.0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final filtered = controller.prize
            .where((e) =>
                e.prizeName
                    .toString()
                    .toLowerCase()
                    .contains(controller.searchPrize.value.toLowerCase()) ||
                e.prizeDesc
                    .toString()
                    .toLowerCase()
                    .contains(controller.searchPrize.value.toLowerCase()))
            .toList();

        return controller.isLoading.value
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
            : Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: BaseSearchInput(
                        hint: 'Search Prize',
                        onChanged: (value) {
                          controller.searchPrize.value = value.toString();
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: BaseRefresh(
                        onRefresh: refreshPrize,
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: controller.searchPrize.value == ''
                              ? controller.prize.length
                              : filtered.length,
                          itemBuilder: (context, index) {
                            final prize = controller.searchPrize.value == ''
                                ? controller.prize[index]
                                : filtered[index];
                            final point = int.parse(prize.point.toString());
                            final userPoint = int.parse(userController
                                .user.value!.loyaltyPoint
                                .toString());

                            return FadeAnimation(
                              delay: 1,
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            FadeAnimation(
                                              delay: 1.3,
                                              child: Image.network(
                                                ApiUrl.prizeStorage +
                                                    prize.image.toString(),
                                                alignment: Alignment.topCenter,
                                                height: 80,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            FadeAnimation(
                                              delay: 1.3,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    prize.prizeDesc.toString()),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FadeAnimation(
                                        delay: 1.3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            userPoint < 50
                                                ? SizedBox(
                                                    height: 25,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            baseColor,
                                                        foregroundColor: yellow,
                                                        shape:
                                                            const StadiumBorder(),
                                                      ),
                                                      onPressed: null,
                                                      child:
                                                          const Text('Redeem'),
                                                    ),
                                                  )
                                                : userPoint < point
                                                    ? SizedBox(
                                                        height: 25,
                                                        child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                baseColor,
                                                            foregroundColor:
                                                                yellow,
                                                            shape:
                                                                const StadiumBorder(),
                                                          ),
                                                          onPressed: null,
                                                          child: const Text(
                                                              'Redeem'),
                                                        ),
                                                      )
                                                    : ConfirmAlertButton(
                                                        btnText: 'Redeem',
                                                        width: 80,
                                                        height: 25,
                                                        alertTitle:
                                                            'Are you sure?',
                                                        alertDesc:
                                                            'You will take ${prize.prizeDesc} and will deduct the points accordingly',
                                                        onCancelPressed: () {
                                                          Get.back();
                                                        },
                                                        onSubmitPressed: () {
                                                          Get.toNamed(
                                                            '/inputpin',
                                                            arguments: [
                                                              prize.prizeCode,
                                                              prize.prizeDesc,
                                                            ],
                                                          );
                                                        },
                                                      ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/point_icon_large.png',
                                                  width: 25,
                                                ),
                                                userPoint < point
                                                    ? FadeAnimation(
                                                        delay: 1.3,
                                                        child: Text(
                                                          prize.point
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.red,
                                                          ),
                                                        ))
                                                    : FadeAnimation(
                                                        delay: 1.3,
                                                        child: Text(
                                                          prize.point
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.green,
                                                          ),
                                                        )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}

// class FormTarik extends StatelessWidget {
//   FormTarik({super.key});
//   final formKey = GlobalKey<FormState>();

//   final List<String> _items = [
//     'Option 1',
//     'Option 2',
//     'Option 3',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // children: [
        // FadeAnimation(
        //   delay: 1.5,
        //   child: BaseDropdown(
        //     hint: 'Nominal Point',
        //     items: _items.map((e) {
        //       return DropdownMenuItem(value: e, child: Text(e));
        //     }).toList(),
        //     onChanged: (val) {},
        //   ),
        // ),
        // SizedBox(
        //   height: 40,
        //   width: Get.width,
        //   child: BaseButton(
        //     text: 'Pull Point',
        //     onPressed: () {},
        //   ),
        // ),
//       ],
//     );
//   }
// }
