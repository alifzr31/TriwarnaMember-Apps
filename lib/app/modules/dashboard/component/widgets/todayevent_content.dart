import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/swiper_box.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
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
                  onTap: () {
                    if (controller.token.value == 'null') {
                      infoSnackbar(
                        "You're not logged in",
                        'You must log in first to access this feature',
                      );
                      Get.toNamed('/login');
                    } else {
                      print('object');
                    }
                  },
                  child: BoxColumnContent(
                    image: 'assets/images/' + today[index],
                    title: title[index],
                    desc: desc[index],
                  ),
                );
              },
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: title.length,
          //     itemBuilder: (context, index) {
          //       return Card(
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10),
          //         ),
          //         elevation: 5,
          //         margin: const EdgeInsets.only(bottom: 10),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Container(
          //               width: 100,
          //               height: 100,
          //               decoration: BoxDecoration(
          //                 borderRadius: const BorderRadius.only(
          //                   topLeft: Radius.circular(10),
          //                   bottomLeft: Radius.circular(10),
          //                 ),
          //                 image: DecorationImage(
          //                   image: Image.asset('assets/images/${today[index]}')
          //                       .image,
          //                   fit: BoxFit.cover,
          //                 ),
          //               ),
          //             ),
          //             Expanded(
          //               child: Padding(
          //                 padding: const EdgeInsets.all(5),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       '${title[index]}',
          //                       style: const TextStyle(
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                     const SizedBox(height: 10),
          //                     Text('${desc[index]}', textAlign: TextAlign.justify,),
          //                   ],
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
