import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:member_apps/app/component/base_button.dart';
import 'package:member_apps/app/component/base_dropdown.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/component/transparent_appbar.dart';
import 'package:member_apps/app/component/white_text.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:member_apps/app/modules/profile/controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppbar(
        title: 'PROFILE',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            HeaderProfile(),
            // const Divider(),
            // FormProfile(),
          ],
        ),
      ),
    );
  }
}

class HeaderProfile extends StatelessWidget {
  HeaderProfile({super.key});
  final userController = Get.find<DashboardController>();
  final controller = Get.find<ProfileController>();

  final List<String> _items = [
    'Male',
    'Female',
  ];

  XFile? picked;

  @override
  Widget build(BuildContext context) {
    controller.nameController.text = userController.user.value!.name!;
    controller.contactController.text = userController.user.value!.contact!;
    controller.cityController.text = userController.user.value!.city!;
    controller.provinceController.text = userController.user.value!.province!;

    return Obx(
      () {
        return userController.user.value == null
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            picked = await picker.pickImage(
                                source: ImageSource.gallery, imageQuality: 80);

                            if (picked!.path != null ||
                                picked!.path.isNotEmpty) {
                              print(picked!.path);
                            } else {
                              print('null');
                            }
                          },
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(
                                    ApiUrl.profileStorage +
                                        '/${userController.user.value!.image}'),
                              ),
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.black.withOpacity(0.3),
                                child: Center(
                                    child: WhiteText(text: 'Select\nPhoto')),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: Get.width * 0.04),
                        userController.user.value!.loyalty == 'Silver'
                            ? Image.asset('assets/images/silver.png',
                                height: 50)
                            : userController.user.value!.loyalty == 'Platinum'
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
                              userController.user.value!.loyalty == 'Silver'
                                  ? Container(
                                      height: 23,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child:
                                          const Center(child: Text('Silver')),
                                    )
                                  : userController.user.value!.loyalty ==
                                          'Platinum'
                                      ? Container(
                                          height: 23,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
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
                                            color: Colors.amber.shade400,
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
                    const Divider(),
                    formProfile(),
                  ],
                ),
              );
      },
    );
  }

  Widget formProfile() {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseTextInput(
                        controller: controller.nameController,
                        label: 'Full Name',
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Email',
                        style: TextStyle(fontSize: 16),
                      ),
                      BaseTextInput(
                        hint: 'Email',
                      ),
                      const SizedBox(height: 15),
                      BaseTextInput(
                        controller: controller.contactController,
                        label: 'Contact',
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Gender',
                        style: TextStyle(fontSize: 16),
                      ),
                      BaseDropdown(
                        hint: 'Gender',
                        items: _items.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (val) {},
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Birth Date',
                        style: TextStyle(fontSize: 16),
                      ),
                      BaseTextInput(
                        hint: 'Birth Date',
                      ),
                      const SizedBox(height: 15),
                      BaseTextInput(
                        controller: controller.provinceController,
                        label: 'Province',
                      ),
                      const SizedBox(height: 15),
                      BaseTextInput(
                        controller: controller.cityController,
                        label: 'City',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            width: Get.width,
            child: BaseButton(
              text: 'Update Profile',
              onPressed: () async {
                print(picked!.path);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FormProfile extends StatelessWidget {
  FormProfile({super.key});
  final List<String> _items = [
    'Male',
    'Female',
  ];

  final userController = Get.find<DashboardController>();
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    controller.nameController.text = userController.user.value!.name!;
    controller.contactController.text = userController.user.value!.contact!;
    controller.cityController.text = userController.user.value!.city!;
    controller.provinceController.text = userController.user.value!.province!;

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseTextInput(
                        controller: controller.nameController,
                        label: 'Full Name',
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Email',
                        style: TextStyle(fontSize: 16),
                      ),
                      BaseTextInput(
                        hint: 'Email',
                      ),
                      const SizedBox(height: 15),
                      BaseTextInput(
                        controller: controller.contactController,
                        label: 'Contact',
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Gender',
                        style: TextStyle(fontSize: 16),
                      ),
                      BaseDropdown(
                        hint: 'Gender',
                        items: _items.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (val) {},
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Birth Date',
                        style: TextStyle(fontSize: 16),
                      ),
                      BaseTextInput(
                        hint: 'Birth Date',
                      ),
                      const SizedBox(height: 15),
                      BaseTextInput(
                        controller: controller.provinceController,
                        label: 'Province',
                      ),
                      const SizedBox(height: 15),
                      BaseTextInput(
                        controller: controller.cityController,
                        label: 'City',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            width: Get.width,
            child: BaseButton(
              text: 'Update Profile',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
