import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_refresh.dart';
import 'package:member_apps/app/component/swiper_box.dart';
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
      body: Column(
        children: [
          Container(
            height: 200,
            width: Get.width,
            decoration: BoxDecoration(
              image: const DecorationImage(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: BaseRefresh(
                onRefresh: () async {
                  await Future.delayed(
                    const Duration(milliseconds: 2500),
                    () async {
                      await Fluttertoast.showToast(
                        msg: 'Promotion Data Refreshed',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black.withOpacity(0.8),
                        textColor: Colors.white,
                        fontSize: 12.0,
                      );
                    },
                  );
                },
                child: ListView(
                  children: const [
                    Promotion(),
                    SizedBox(height: 10),
                    MonthlyPromotion(),
                  ],
                ),
              ),
            ),
          ),
        ],
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
  final SwiperController swiperController = SwiperController();

  List Images = [
    'promotion1.png',
    'promotion2.png',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 230,
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
          child: SwiperBox(
            controller: swiperController,
            itemCount: Images.length,
            itemBuilder: (context, index) {
              return BoxContent(image: 'assets/images/' + Images[index]);
            },
            onIndexChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            Images.length,
            (indexDots) {
              return Container(
                margin: const EdgeInsets.only(right: 5),
                height: 7,
                width: _currentPage == indexDots ? 16 : 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _currentPage == indexDots ? baseColor : yellow,
                ),
              );
            },
          ),
        )
        ],
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
  final SwiperController swiperController = SwiperController();

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

    return SizedBox(
      width: Get.width,
      height: 230,
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
          child: SwiperBox(
            controller: swiperController,
            itemCount: Images.length,
            itemBuilder: (context, index) {
              return BoxContent(image: 'assets/images/' + Images[index]);
            },
            onIndexChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            Images.length,
            (indexDots) {
              return Container(
                margin: const EdgeInsets.only(right: 5),
                height: 7,
                width: _currentPage == indexDots ? 16 : 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _currentPage == indexDots ? baseColor : yellow,
                ),
              );
            },
          ),
        )
        ],
      ),
    );
  }
}
