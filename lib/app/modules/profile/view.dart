import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_button.dart';
import 'package:member_apps/app/component/base_date_picker.dart';
import 'package:member_apps/app/component/base_dropdown.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/component/base_textarea.dart';
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

                          if (picked!.path != null || picked!.path.isNotEmpty) {
                            print(picked!.path);

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
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  ApiUrl.profileStorage +
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
                              child: Center(
                                  child: WhiteText(text: 'Select\nPhoto')),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: Get.width * 0.04),
                      userController.user.value!.loyalty.toString().capitalize == 'Silver'
                          ? Image.asset('assets/images/silver.png', height: 50)
                          : userController.user.value!.loyalty.toString().capitalize == 'Platinum'
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
                            userController.user.value!.loyalty.toString().capitalize == 'Silver'
                                ? Container(
                                    height: 23,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: const Center(child: Text('Silver')),
                                  )
                                : userController.user.value!.loyalty.toString().capitalize ==
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
                  const SizedBox(height: 20),
                  formProfile(),
                  SizedBox(
                    height: 40,
                    width: Get.width,
                    child: BaseButton(
                      text: 'Update Profile',
                      onPressed: () async {
                        print(picked);
                        if (controller.formKey.currentState!.validate()) {
                          controller.updateProfile(picked);
                        }
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }

  final List<String> _items = [
    'Male',
    'Female',
  ];

  String? selectedGender;
  String? selectedVillage;

  Widget formProfile() {
    controller.nameController.text = userController.user.value!.name.toString();
    controller.emailController.text =
        userController.user.value!.email.toString();
    controller.addressController.text =
        userController.user.value!.address.toString();

    if (userController.user.value!.gender == 'Laki-Laki') {
      selectedGender = 'Male';
    } else {
      selectedGender = 'Female';
    }

    final formatter = DateFormat('yyyy-MM-dd');
    final date = formatter.format(userController.user.value!.birthDate);
    var selectedDate = date;
    // controller.birthController.text = date.toString();

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Obx(
            () => userController.user.value == null
                ? Container()
                : Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Full Name',
                          style: TextStyle(fontSize: 16),
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: BaseTextInput(
                            controller: controller.nameController,
                            hint: 'Your Full Name',
                            validator: (value) {
                              if (value!.isEmpty || value == null) {
                                return 'Please input your full name';
                              }

                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Email',
                          style: TextStyle(fontSize: 16),
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: BaseTextInput(
                            controller: controller.emailController,
                            enabled: false,
                            hint: 'Email Address',
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Gender',
                          style: TextStyle(fontSize: 16),
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: BaseDropdown(
                            hint: 'Your Gender',
                            value: selectedGender,
                            items: _items.map((e) {
                              return DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                selectedGender = value as String;
                                
                                if (selectedGender == 'Male') {
                                  controller.genderController.text =
                                      'Laki-Laki';
                                } else if (selectedGender == 'Female') {
                                  controller.genderController.text =
                                      'Perempuan';
                                }
                              });
                              print(controller.genderController.text);
                            },
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Birth Date',
                          style: TextStyle(fontSize: 16),
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: BaseDatePicker(
                            initialValue: selectedDate,
                            hint: 'Your Birth Date',
                            validator: 'Choose Your Birth Date',
                            onChanged: (val) {
                              setState(() {
                                selectedDate = val.toString();
                                controller.birthController.text = selectedDate;
                              });
                              print(controller.birthController.text);
                            },
                            onSaved: (val) {
                              setState(() {
                                controller.birthController.text = val!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Address',
                          style: TextStyle(fontSize: 16),
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: BaseTextArea(
                            controller: controller.addressController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            hint: 'Your Address',
                            validator: (value) {
                              if (value!.isEmpty || value == null) {
                                return 'Please input your address';
                              }

                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Village',
                          style: TextStyle(fontSize: 16),
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: TypeAheadFormField(
                            hideSuggestionsOnKeyboardHide: false,
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: controller.villageController,
                              decoration: const InputDecoration(
                                hintText: 'Your Village',
                              ),
                            ),
                            suggestionsCallback: (pattern) async {
                              return controller.village
                                  .where((element) => element.namaKelurahan
                                      .toString()
                                      .toLowerCase()
                                      .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, suggestion) {
                              return ListTile(
                                title: FadeAnimation(
                                  delay: 1,
                                  child:
                                      Text(suggestion.namaKelurahan.toString()),
                                ),
                                subtitle: FadeAnimation(
                                  delay: 1.5,
                                  child:
                                      Text(suggestion.namaKecamatan.toString()),
                                ),
                              );
                            },
                            onSuggestionSelected: (suggestion) {
                              setState(() {
                                controller.selectedVillage.value =
                                    suggestion.kdKelurahan.toString();
                                controller.villageController.text =
                                    suggestion.namaKelurahan.toString();
                              });

                              print(selectedVillage);
                            },
                            onSaved: (newValue) {
                              print('Hasil print onsaved: ' +
                                  newValue.toString());
                            },
                            validator: (value) {
                              if (value!.isEmpty ||
                                  value == null ||
                                  controller.selectedVillage.value.isEmpty ||
                                  controller.selectedVillage.value == null) {
                                return 'Choose Your Village';
                              }

                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
