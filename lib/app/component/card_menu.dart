import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({
    Key? key,
    this.onTap,
    required this.svgAsset,
  }) : super(key: key);

  final void Function()? onTap;
  final String svgAsset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(svgAsset),
          ),
        ),
      ),
    );
  }
}
