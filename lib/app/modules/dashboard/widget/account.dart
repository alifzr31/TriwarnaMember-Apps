import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/component/white_text.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          HeaderAccount(),
          BodyAccount(),
        ],
      ),
    );
  }
}

class HeaderAccount extends StatelessWidget {
  const HeaderAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipperOne(flip: true),
          child: Container(
            height: 380,
            color: yellow,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 10,
          child: ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              padding: const EdgeInsets.all(10),
              color: baseColor,
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              'https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg'),
                        ),
                        Image.asset('assets/images/platinum.png', height: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Alif Zakya Rafiq",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              height: 23,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(child: Text('Platinum')),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                WhiteText(text: 'No Member'),
                                WhiteText(text: '123456789'),
                                Divider(),
                                WhiteText(text: 'Address'),
                                WhiteText(text: 'Blok Citopeng No. 327'),
                              ],
                            ),
                            const SizedBox(width: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                WhiteText(text: 'Username'),
                                WhiteText(text: 'alifzr31'),
                                Divider(),
                                WhiteText(text: 'Contact'),
                                WhiteText(text: '081221112586'),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 45),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 25,
                            margin: const EdgeInsets.only(left: 15),
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed('/profile');
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: yellow,
                                foregroundColor: baseColor,
                              ),
                              child: const Text('Edit Profile'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BodyAccount extends StatelessWidget {
  const BodyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Image.asset('assets/images/point_icon_small.png'),
              title: const Text('Point'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Get.toNamed('/point');
              },
            ),
            ListTile(
              leading: const Icon(
                Bootstrap.door_open_fill,
                color: Colors.black,
              ),
              title: const Text('Log Out'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                prefs.setBool('opened', true);

                Get.offAllNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
