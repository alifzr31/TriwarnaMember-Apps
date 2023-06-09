import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_refresh.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/data/providers/shopping_provider.dart';
import 'package:member_apps/app/modules/shopping/controller.dart';
import 'package:member_apps/app/modules/shopping/shopping_detail/detail_shopping_modal.dart';
import 'package:member_apps/app/modules/shopping/shopping_detail/shopping_detail_controller.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

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
                      'Shopping History',
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
                delay: 1.3,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Let's see what you've bought",
                    style: TextStyle(
                      color: baseColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const ListHistory(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListHistory extends StatefulWidget {
  const ListHistory({super.key});

  @override
  State<ListHistory> createState() => _ListHistoryState();
}

class _ListHistoryState extends State<ListHistory> {
  final controller = Get.find<ShoppingController>();
  final detailShoppingController = Get.find<ShoppingDetailController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
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
            : controller.shopping.length < 1
                ? Expanded(
                    child: FadeAnimation(
                      delay: 1,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/noshoppinghistory.svg',
                          width: Get.width < 390 ? 170 : 200,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: BaseRefresh(
                      onRefresh: () async {
                        await Future.delayed(const Duration(milliseconds: 2500),
                            () async {
                          controller.fetchShopping();

                          await Fluttertoast.showToast(
                            msg: 'Shopping History Refreshed',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black.withOpacity(0.8),
                            textColor: Colors.white,
                            fontSize: 12.0,
                          );
                        });
                      },
                      child: ListView.builder(
                        itemCount: controller.shopping.length,
                        itemBuilder: (context, index) {
                          final shopping = controller.shopping[index];

                          double ttl = double.parse(shopping.total.toString());
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
                                  // crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Column(
                                            children: [
                                              Text(
                                                date,
                                                style: const TextStyle(
                                                  color: baseColor,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              SizedBox(
                                                height: 25,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    detailShoppingController.docnum.value = shopping.docnum.toString();

                                                    detailShoppingBottomSheet(
                                                      DetailShoppingModal(
                                                        no_struk:
                                                            shopping.noStruk ??
                                                                '',
                                                      ),
                                                    );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: baseColor,
                                                    foregroundColor: yellow,
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  child: const Text(
                                                    'View Detail',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 1,
                                  width: Get.width,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  color: yellow,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
      },
    );
  }
}
