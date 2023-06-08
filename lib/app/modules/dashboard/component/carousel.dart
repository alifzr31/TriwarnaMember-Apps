import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/core/value.dart';

class CarouselField extends StatefulWidget {
  const CarouselField({super.key});

  @override
  State<CarouselField> createState() => _CarouselFieldState();
}

class _CarouselFieldState extends State<CarouselField> {
  List images = [
    'carousel.png',
    'carousel2.png',
    'carousel3.png',
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -20,
          // left: 0,
          // right: 0,
          child: Container(
            width: Get.width,
            height: 130,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/wave2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Expanded(
              child: Swiper(
                itemCount: images.length,
                curve: Curves.bounceOut,
                onIndexChanged: (value) {
                  print(value);
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.black.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/' + images[index]),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) {
                  print(index);
                  return Container(
                    margin: const EdgeInsets.only(right: 8, bottom: 8),
                    height: 6,
                    width: currentPage == index ? 18 : 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentPage == index ? yellow : Colors.grey,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
