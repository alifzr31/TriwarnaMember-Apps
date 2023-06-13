import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:member_apps/app/core/value.dart';

void loading(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (context) {
      return LoadingAnimationWidget.flickr(
        leftDotColor: baseColor,
        rightDotColor: yellow,
        size: 80,
      );
    },
  );
}
