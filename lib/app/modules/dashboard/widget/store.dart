import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:member_apps/app/core/value.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => MapsLauncher.launchCoordinates(-6.9119402322126176,
            107.63690728209326, 'PT Anyar Retail Indonesia'),
        style: ElevatedButton.styleFrom(
          backgroundColor: baseColor,
          shape: const StadiumBorder(),
        ),
        child: const Text('Store'),
      ),
    );
  }
}
