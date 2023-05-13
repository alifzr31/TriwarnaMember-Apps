import 'package:flutter/material.dart';
import 'package:member_apps/app/core/value.dart';

import '../animation/fadeanimation.dart';

class MenuBox extends StatelessWidget {
  const MenuBox({
    Key? key,
    required this.onTap,
    required this.image,
  }) : super(key: key);

  final void Function() onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          width: 250,
          decoration: BoxDecoration(
            color: baseColor,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}
