import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/menu_box.dart';
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
                'Get to know all event for you on Triwarna',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: baseColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            LotteryAnnouncement(),
            TodayEvent(),
          ],
        ),
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
  final ScrollController scrollController = ScrollController();

  List Images = [
    'announ1.png',
    'announ2.png',
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

class TodayEvent extends StatefulWidget {
  const TodayEvent({super.key});

  @override
  State<TodayEvent> createState() => _TodayEventState();
}

class _TodayEventState extends State<TodayEvent> {
  final ScrollController scrollController = ScrollController();

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
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: today.length,
                itemBuilder: (context, index) {
                  return FadeAnimation(
                    delay: 1,
                    child: Column(
                      children: [
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/' + today[index]),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 250,
                          decoration: BoxDecoration(
                            color: yellow,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  desc[index],
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
