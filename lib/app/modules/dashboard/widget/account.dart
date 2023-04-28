import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/component/white_text.dart';
import 'package:member_apps/app/component/yellow_button.dart';
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
    return Container(
      width: Get.width,
      height: 380,
      decoration: const BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                        'https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg'),
                  ),
                  SizedBox(width: Get.width * 0.08),
                  Image.asset('assets/images/platinum.png', height: 50),
                  SizedBox(width: Get.width * 0.1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WhiteText(
                        text: 'Alif Zakya Rafiq',
                        bold: FontWeight.bold,
                        size: 16,
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Platinum',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 25,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/profile');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: yellow,
                          foregroundColor: baseColor,
                          shape: const StadiumBorder(),
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
    );
  }
}

class BodyAccount extends StatelessWidget {
  const BodyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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

            Get.offAllNamed('/onboard');
          },
        ),
      ],
    );
  }
}
