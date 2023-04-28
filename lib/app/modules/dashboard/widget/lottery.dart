import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/component/grey_text.dart';
import 'package:member_apps/app/component/white_text.dart';

class LotteryPage extends StatelessWidget {
  const LotteryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderLottery(),
            const Divider(),
            BodyLottery(),
          ],
        ),
      ),
    );
  }
}

class HeaderLottery extends StatelessWidget {
  const HeaderLottery({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/head.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WhiteText(text: 'Data Diri', bold: FontWeight.bold, size: 18),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.contacts,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          const WhiteText(text: 'No Member'),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          GreyText(text: '0202020202'),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const Icon(
                            Icons.work,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          const WhiteText(text: 'Pekerjaan'),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          GreyText(text: 'Swasta'),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          const WhiteText(text: 'Alamat'),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          GreyText(text: 'Jl. Nanjung'),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const Icon(
                            Icons.card_membership,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          const WhiteText(text: 'Loyalty Level'),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          GreyText(text: 'SILVER'),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person_2_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          const WhiteText(text: 'Nama'),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          GreyText(text: 'Nandang Hermawan'),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const Icon(
                            Icons.credit_card,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          const WhiteText(text: 'No KTP'),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          GreyText(text: '3201030897000123'),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone_android,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          const WhiteText(text: 'No Handphone'),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          GreyText(text: '082119980819'),
                        ],
                      ),
                      const SizedBox(height: 50)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BodyLottery extends StatelessWidget {
  const BodyLottery({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/nodata.png', width: 200),
            const Divider(),
            const Text('TIDAK ADA UNDIAN'),
          ],
        ),
      ),
    );
  }
}