import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/swiper_box.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';

class TodayEventContent extends StatefulWidget {
  const TodayEventContent({super.key});

  @override
  State<TodayEventContent> createState() => _TodayEventContentState();
}

class _TodayEventContentState extends State<TodayEventContent> {
  final SwiperController swiperController = SwiperController();
  final controller = Get.find<DashboardController>();
  List today = [
    'today1.png',
    'today2.png',
  ];

  List title = [
    'Lorem Ipsum',
    'Lorem Ipsum',
  ];

  List desc = [
    'Lorem Ipsum dolor sit amet lorem ipsum dolor sit amet',
    'Lorem Ipsum dolor sit amet lorem ipsum dolor sit amet',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Column(
        children: [
          FadeAnimation(
            delay: 1,
            child: controller.token.value == 'null'
                ? const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Today Event',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Today Event',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/event');
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
          Expanded(
            child: SwiperBox(
              onTap: (index) {},
              controller: swiperController,
              itemCount: today.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: BoxColumnContent(
                    image: 'assets/images/' + today[index],
                    title: title[index],
                    desc: desc[index],
                  ),
                );
              },
              onIndexChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
