import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () async {
        navigate();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back-splash.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Stack(
              children: [
                Center(child: Image.asset('assets/images/splash.png')),
                Positioned(
                  bottom: 150,
                  left: 30,
                  right: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        SpinKitWave(
                          size: 20,
                          itemBuilder: (BuildContext context, int index) {
                            return const DecoratedBox(
                              decoration: BoxDecoration(
                                color: yellow,
                              ),
                            );
                          },
                        ),
                        // const Divider(),
                        // const Text(
                        //   'Powered By',
                        //   style: TextStyle(fontSize: 16, color: yellow),
                        // ),
                        // const Text(
                        //   'DEV-IT AnyarGroup | 2023',
                        //   style: TextStyle(fontSize: 16, color: yellow),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void navigate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final opened = prefs.getBool('opened');

  if (opened != null) {
    Get.offAndToNamed('/dashboard');
  } else {
    Get.offAndToNamed('/onboard');
  }
}
