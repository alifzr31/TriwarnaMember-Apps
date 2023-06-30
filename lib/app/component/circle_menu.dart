import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/core/value.dart';

class CircleMenu extends StatelessWidget {
  const CircleMenu({
    Key? key,
    required this.svgIcon,
    required this.sizeIcon,
    required this.label,
    this.onTap,
  });

  final String svgIcon;
  final double sizeIcon;
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeAnimation(
          delay: 1,
          child: GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: baseColor,
              child: SvgPicture.asset(
                'assets/images/$svgIcon',
                width: sizeIcon,
              ),
            ),
          ),
        ),
        FadeAnimation(
          delay: 1.3,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
