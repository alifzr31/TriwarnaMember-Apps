import 'package:flutter/material.dart';
import 'package:member_apps/app/core/value.dart';

class BaseRefresh extends StatelessWidget {
  const BaseRefresh({
    Key? key,
    required this.child,
    required this.onRefresh,
  }) : super(key: key);

  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: baseColor,
      color: yellow,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
