import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/menu_box.dart';
import 'package:member_apps/app/core/value.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 94, 49, 130),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: yellow,
          ),
        ),
        toolbarHeight: 45,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 250,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/header-event.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            FadeAnimation(
              delay: 1,
              child: const Text(
                'Get the best promotions Triwarna',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: baseColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Promotion(),
            MonthlyPromotion(),
          ],
        ),
      ),
    );
  }
}

class Promotion extends StatefulWidget {
  const Promotion({super.key});

  @override
  State<Promotion> createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  final ScrollController scrollController = ScrollController();

  List Images = [
    'promotion1.png',
    'promotion2.png',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            FadeAnimation(
              delay: 1,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Promotion',
                  style: TextStyle(
                    color: baseColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: Images.length,
                itemBuilder: (context, index) {
                  return MenuBox(
                    onTap: () {},
                    image: 'assets/images/' + Images[index],
                  );
                },
              ),
            ),
            // SizedBox(
            //   height: 20,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: List.generate(
            //       today.length,
            //       (indexDots) {
            //         return Container(
            //           margin: const EdgeInsets.only(right: 8),
            //           height: 8,
            //           width: _currentPage == indexDots ? 18 : 8,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: _currentPage == indexDots ? baseColor : yellow,
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class MonthlyPromotion extends StatefulWidget {
  const MonthlyPromotion({super.key});

  @override
  State<MonthlyPromotion> createState() => _MonthlyPromotionState();
}

class _MonthlyPromotionState extends State<MonthlyPromotion> {
  final ScrollController scrollController = ScrollController();

  List Images = [
    'promotion1.png',
    'promotion2.png',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.now();
    final formatter = DateFormat('MMMM yyyy');
    final bulanTahun = formatter.format(dateTime);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            FadeAnimation(
              delay: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '$bulanTahun Promotion',
                  style: const TextStyle(
                    color: baseColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: Images.length,
                itemBuilder: (context, index) {
                  return MenuBox(
                    onTap: () {},
                    image: 'assets/images/' + Images[index],
                  );
                },
              ),
            ),
            // SizedBox(
            //   height: 20,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: List.generate(
            //       today.length,
            //       (indexDots) {
            //         return Container(
            //           margin: const EdgeInsets.only(right: 8),
            //           height: 8,
            //           width: _currentPage == indexDots ? 18 : 8,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: _currentPage == indexDots ? baseColor : yellow,
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
