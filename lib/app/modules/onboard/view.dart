import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_to_act/slide_to_act.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final PageController _pageController = PageController(initialPage: 0);

  List Images = [
    'onboard1.png',
    'onboard2.png',
    'onboard3.png',
  ];

  List title = ['One Stop', '', ''];

  List subtitle = ['Painting & Decorating Solution', '', ''];

  List desc = [
    'We provide all the points to enhance your walls',
    'Paint your walls with the best quality paint',
    'We provide the best quality for your paint needs.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: Images.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Column(
                children: [
                  if (index == 1) SizedBox(height: Get.width < 390 ? Get.height < 593 ? 130 : 150 : 180),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeAnimation(
                                delay: 1,
                                child: Text(
                                  title[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Get.width < 390 ? 26 : 28,
                                  ),
                                ),
                              ),
                              FadeAnimation(
                                delay: 1,
                                child: Text(
                                  subtitle[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.width < 390 ? 18 : 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: List.generate(
                            3,
                            (indexDots) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                width: 5,
                                height: index == indexDots ? 18 : 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: index == indexDots
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Get.width < 390
                      ? SizedBox(height: 0)
                      : SizedBox(height: Get.height / 100 * 7),
                  index == 2
                      ? SizedBox(height: Get.height * 0.54)
                      : index == 0
                          ? FadeAnimation(
                              delay: 1,
                              child: Column(
                                children: [
                                  SizedBox(height: Get.width < 390 ? 40 : 60),
                                  Image.asset(
                                    'assets/images/' + Images[index],
                                    width: Get.width < 390 ? 200 : null,
                                  ),
                                ],
                              ),
                            )
                          : FadeAnimation(
                              delay: 1,
                              child: Image.asset(
                                'assets/images/' + Images[index],
                                width: Get.width < 390 ? 280 : null,
                              ),
                            ),
                  SizedBox(height: Get.width < 390 ? 30 : 40),
                  FadeAnimation(
                    delay: 1,
                    child: Text(
                      desc[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: Get.height / 100 * 4),
                  if (index == 2)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Builder(
                        builder: (context) {
                          final GlobalKey<SlideActionState> key = GlobalKey();

                          return FadeAnimation(
                            delay: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SlideAction(
                                key: key,
                                sliderRotate: false,
                                text: 'Get Started',
                                textStyle: const TextStyle(
                                  color: baseColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                onSubmit: () async {
                                  await Future.delayed(
                                    const Duration(seconds: 1),
                                    () async {
                                      await key.currentState!.reset();
                                      Get.offAllNamed('/dashboard0');
                                    },
                                  );
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setBool('opened', true);
                                },
                                innerColor: baseColor,
                                outerColor: Colors.white,
                                sliderButtonIconSize: Get.width < 390 ? 13 : 20,
                                height: Get.width < 390 ? 50 : 60,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
              if (index == 1)
                Positioned(
                  top: Get.width < 390 ? -10 : 0,
                  left: 0,
                  right: 0,
                  child: FadeAnimation(
                    delay: 1,
                    child: Image.asset(
                      'assets/images/headonboard2.png',
                      fit: BoxFit.cover,
                      height: Get.height < 593 ? 200 : null,
                    ),
                  ),
                ),
              if (index == 2)
                Positioned(
                  top: 130,
                  right: -30,
                  child: FadeAnimation(
                    delay: 1,
                    child: Image.asset(
                      'assets/images/onboard3.png',
                      width: Get.width < 390 ? 300 : null,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
