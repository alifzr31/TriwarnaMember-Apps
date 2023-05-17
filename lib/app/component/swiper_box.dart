import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/core/value.dart';

class SwiperBox extends StatelessWidget {
  const SwiperBox({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.onTap,
    this.onIndexChanged,
    this.controller,
  }) : super(key: key);

  final void Function(int)? onTap;
  final SwiperController? controller;
  final void Function(int)? onIndexChanged;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      controller: controller,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      viewportFraction: 0.75,
      scale: 0.9,
      onTap: onTap,
      onIndexChanged: onIndexChanged,
    );
  }
}

class BoxContent extends StatelessWidget {
  const BoxContent({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: 1.3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class BoxColumnContent extends StatelessWidget {
  const BoxColumnContent({
    Key? key,
    required this.image,
    required this.title,
    required this.desc,
  }) : super(key: key);

  final String image;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: 1.3,
      child: Column(
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          Container(
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
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    desc,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
