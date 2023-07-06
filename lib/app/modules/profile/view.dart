import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:member_apps/app/component/transparent_appbar.dart';
import 'package:member_apps/app/component/white_text.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:member_apps/app/core/utils/gradient_color.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:member_apps/app/modules/profile/component/form_updateprofile.dart';
import 'package:member_apps/app/modules/profile/controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppbar(
        title: 'Profile',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: HeaderProfile(),
      ),
    );
  }
}

class HeaderProfile extends StatefulWidget {
  const HeaderProfile({super.key});

  @override
  State<HeaderProfile> createState() => _HeaderProfileState();
}

class _HeaderProfileState extends State<HeaderProfile> {
  final userController = Get.find<DashboardController>();
  final controller = Get.find<ProfileController>();

  XFile? picked;
  var visible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return userController.user.value == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          picked = await picker.pickImage(
                              source: ImageSource.gallery, imageQuality: 80);

                          if (picked?.path != null) {
                            print(picked?.path);

                            setState(() {
                              visible.value = true;
                            });
                          } else {
                            print('null');
                            setState(() {
                              visible.value = false;
                            });
                          }
                        },
                        child: Stack(
                          children: [
                            userController.user.value!.image == null
                                ? const CircleAvatar(
                                    radius: 50,
                                    backgroundColor: yellow,
                                    child: Icon(
                                      Icons.person,
                                      size: 60,
                                      color: baseColor,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(ApiUrl
                                            .profileStorage +
                                        '/${userController.user.value!.image}'),
                                  ),
                            if (picked != null)
                              Visibility(
                                visible: visible.value,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      FileImage(File(picked!.path)),
                                ),
                              ),
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.black.withOpacity(0.3),
                              child: const Center(
                                child: WhiteText(
                                  text: 'Select\nPhoto',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: Get.width * 0.04),
                      userController.user.value!.loyalty
                                  .toString()
                                  .capitalize ==
                              'Silver'
                          ? Image.asset('assets/images/silver.png', height: 50)
                          : userController.user.value!.loyalty
                                      .toString()
                                      .capitalize ==
                                  'Platinum'
                              ? Image.asset('assets/images/platinum.png',
                                  height: 50)
                              : Image.asset('assets/images/gold.png',
                                  height: 50),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userController.user.value!.name!.capitalize!,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            userController.user.value!.loyalty
                                        .toString()
                                        .capitalize ==
                                    'Silver'
                                ? Container(
                                    height: 23,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      gradient: GradientColor.silver,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: const Center(child: Text('Silver')),
                                  )
                                : userController.user.value!.loyalty
                                            .toString()
                                            .capitalize ==
                                        'Platinum'
                                    ? Container(
                                        height: 23,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          gradient: GradientColor.platinum,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: const Center(
                                            child: Text('Platinum')),
                                      )
                                    : Container(
                                        height: 23,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          gradient: GradientColor.gold,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child:
                                            const Center(child: Text('Gold')),
                                      ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  FormUpdateProfle(picked: picked),
                ],
              );
      },
    );
  }
}
