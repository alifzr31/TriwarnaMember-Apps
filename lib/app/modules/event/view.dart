import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_refresh.dart';
import 'package:member_apps/app/component/swiper_box.dart';
import 'package:member_apps/app/core/value.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

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
              'Get to know all event for you on Triwarna',
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
                        msg: 'Event Data Refreshed',
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
                    LotteryAnnouncement(),
                    SizedBox(height: 10),
                    TodayEvent(),
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

class LotteryAnnouncement extends StatefulWidget {
  const LotteryAnnouncement({super.key});

  @override
  State<LotteryAnnouncement> createState() => _LotteryAnnouncementState();
}

class _LotteryAnnouncementState extends State<LotteryAnnouncement> {
  final SwiperController swiperController = SwiperController();

  List Images = [
    'announ1.png',
    'announ2.png',
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
                'Lottery Announcement',
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

class TodayEvent extends StatefulWidget {
  const TodayEvent({super.key});

  @override
  State<TodayEvent> createState() => _TodayEventState();
}

class _TodayEventState extends State<TodayEvent> {
  final SwiperController swiperController = SwiperController();
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
      width: Get.width,
      height: 230,
      child: Column(
        children: [
          FadeAnimation(
            delay: 1,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Today Event',
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
              onTap: (index) {},
              controller: swiperController,
              itemCount: today.length,
              itemBuilder: (context, index) {
                return BoxColumnContent(
                  image: 'assets/images/' + today[index],
                  title: title[index],
                  desc: desc[index],
                );
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
              today.length,
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
          ),
        ],
      ),
    );
  }
}
