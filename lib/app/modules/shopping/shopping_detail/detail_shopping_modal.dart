import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/shopping/shopping_detail/shopping_detail_controller.dart';

class DetailShoppingModal extends StatefulWidget {
  const DetailShoppingModal({
    Key? key,
    required this.no_struk,
  });

  final String no_struk;

  @override
  State<DetailShoppingModal> createState() => _DetailShoppingModalState();
}

class _DetailShoppingModalState extends State<DetailShoppingModal> {
  final controller = Get.find<ShoppingDetailController>();

  @override
  void initState() {
    controller.fetchShoppingDetail();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? Center(
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
          )
          : controller.reloadOther.value
              ? Center(
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
              )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Text(
                        'Shopping Detail',
                        style: TextStyle(
                          fontSize: 20,
                          color: baseColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.no_struk,
                        style: const TextStyle(
                          fontSize: 16,
                          color: baseColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Total : ${controller.total.value}',
                          style: const TextStyle(color: baseColor),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: controller.shoppingDetail.length,
                          itemBuilder: (context, index) {
                            final shoppingDetail =
                                controller.shoppingDetail[index];
                            late final String harga;
                            late final String subTotal;

                            if (controller.shoppingDetail.isNotEmpty) {
                              harga = NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: 'Rp ',
                              ).format(int.parse(shoppingDetail.harga ?? '0'));

                              subTotal = NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: 'Rp ',
                              ).format(
                                  int.parse(shoppingDetail.subTotal ?? '0'));
                            }

                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            shoppingDetail.dscription
                                                .toString(),
                                            style: const TextStyle(
                                                color: baseColor),
                                          ),
                                          Text(
                                            'Quantity : ' +
                                                shoppingDetail.qty.toString(),
                                            style: const TextStyle(
                                                color: baseColor),
                                          ),
                                          Text(
                                            'Price : $harga',
                                            style: const TextStyle(
                                                color: baseColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Subtotal : $subTotal',
                                      style: const TextStyle(color: baseColor),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 1,
                                  width: Get.width,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  color: yellow,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}

void detailShoppingBottomSheet(Widget child) async {
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
      height: Get.width < 390 ? 350 : 400,
      child: child,
    ),
  );
}
