import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:member_apps/app/core/value.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => MapsLauncher.launchCoordinates(-6.9119402322126176,
                107.63690728209326, 'PT Anyar Retail Indonesia'),
            style: ElevatedButton.styleFrom(
              backgroundColor: baseColor,
              shape: const StadiumBorder(),
            ),
            child: const Text('Store'),
          ),
          ElevatedButton(
            onPressed: () {
              final snackBar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                width: Get.width,
                duration: const Duration(milliseconds: 3000),
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'On Snap!',
                  message:
                      'This is an example error message that will be shown in the body of snackbar!',
                  inMaterialBanner: true,
                  contentType: ContentType.failure,
                ),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: baseColor,
              shape: const StadiumBorder(),
            ),
            child: const Text('notif'),
          ),
        ],
      ),
    );
  }
}
