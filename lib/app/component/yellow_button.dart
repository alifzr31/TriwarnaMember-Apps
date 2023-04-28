import 'package:flutter/material.dart';
import 'package:member_apps/app/core/value.dart';

class YellowButton extends StatelessWidget {
  const YellowButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: yellow,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3),
      child: Text(
        text,
        style: const TextStyle(color: baseColor),
      ),
    );
  }
}
