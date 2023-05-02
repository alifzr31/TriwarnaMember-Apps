import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/component/point_text..dart';
import 'package:member_apps/app/component/transparent_appbar.dart';
import 'package:member_apps/app/component/white_text.dart';
import 'package:member_apps/app/core/value.dart';

class PointPage extends StatelessWidget {
  const PointPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    height: 350,
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
                              children: const [
                                WhiteText(
                                    text:
                                        '1. Points that can be redeemed in increments of 50'),
                                Divider(),
                                WhiteText(
                                    text:
                                        '2. The balance taken cannot exceed your active points'),
                                Divider(),
                                WhiteText(
                                    text:
                                        '3. The time limit of the disbursed balance is 1 month'),
                                Divider(),
                                WhiteText(
                                    text:
                                        '4. If the balance that has been disbursed is not spent then the voucher cannot be used (Forfeited)'),
                                Divider(),
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
                  shape: RoundedRectangleBorder(
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
  const HeaderPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/point_icon_large.png'),
        PointText(text: '527', size: 34),
        ElevatedButton(
          onPressed: () {
            Get.toNamed('/tarikpoint');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: baseColor,
            shape: const StadiumBorder(),
          ),
          child: const Text('Tarik Point'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WhiteText(text: 'Platinum', bold: FontWeight.bold, size: 16),
                  WhiteText(
                      text: '100.000.000/100.000.000',
                      bold: FontWeight.bold,
                      size: 16),
                ],
              ),
              const Divider(),
              Container(
                height: 8,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              const Divider(),
              Row(
                children: [
                  WhiteText(
                      text: 'Transaksi Terakhir ',
                      size: 12,
                      bold: FontWeight.bold),
                  WhiteText(
                      text: ': Tarik point telah berhasil 03/03/2023',
                      size: 12),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class HistorySaldo extends StatelessWidget {
  const HistorySaldo({super.key});

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
                'Riwayat Saldo',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView(
              children: [
                Card(
                  color: Colors.transparent,
                  margin: const EdgeInsets.only(bottom: 10),
                  elevation: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Pull point has been successfully',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('03/03/2023',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text(
                        '-200',
                        style: const TextStyle(color: Colors.red),
                      ),
                      Row(
                        children: [
                          const Text('Remaining Points :',
                              style: TextStyle(color: baseColor)),
                          PointText(text: ' 527'),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  color: Colors.transparent,
                  margin: const EdgeInsets.only(bottom: 10),
                  elevation: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Pull point has been successfully',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('03/03/2023',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text(
                        '+200',
                        style: const TextStyle(color: Colors.green),
                      ),
                      Row(
                        children: [
                          const Text('Remaining Points :',
                              style: TextStyle(color: baseColor)),
                          PointText(text: ' 527'),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
