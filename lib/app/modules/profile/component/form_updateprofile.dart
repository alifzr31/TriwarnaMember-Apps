import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_button.dart';
import 'package:member_apps/app/component/base_date_picker.dart';
import 'package:member_apps/app/component/base_dropdown.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/component/base_textarea.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:member_apps/app/modules/profile/component/jobs_model.dart';
import 'package:member_apps/app/modules/profile/controller.dart';

class FormUpdateProfle extends StatelessWidget {
  FormUpdateProfle({
    Key? key,
    this.picked,
  }) : super(key: key);

  final XFile? picked;

  final controller = Get.find<ProfileController>();

  final userController = Get.find<DashboardController>();

  final List<String> _gender = [
    'Laki-Laki',
    'Perempuan',
  ];

  final List<String> _idType = [
    'KTP',
    'SIM',
  ];

  final List<String> _education = [
    'SD',
    'SMP',
    'SMA',
    'D3',
    'S1',
    'S2/S3',
  ];

  final List<Jobs> _job = [
    Jobs(id: '1', jenis: 'Umum'),
    Jobs(id: '2', jenis: 'Kontraktor'),
    Jobs(id: '3', jenis: 'Tukang'),
    Jobs(id: '4', jenis: 'Mandor'),
  ];

  final List<String> _religion = [
    'Islam',
    'Protestan',
    'Katolik',
    'Konghucu',
    'Hindu',
    'Buddha',
  ];

  final List<String> _marital = [
    'Menikah',
    'Belum Menikah',
  ];

  @override
  Widget build(BuildContext context) {
    String? selected;

    if (userController.user.value != null) {
      controller.nameController.text = userController.user.value!.name ?? '';
      controller.usernameController.text =
          userController.user.value!.username ?? '';
      controller.emailController.text = userController.user.value!.email ?? '';
      controller.genderController.text =
          userController.user.value!.gender ?? '';
      controller.addressController.text =
          userController.user.value!.address ?? '';
      controller.birthController.text =
          userController.user.value!.birthDate.toString();
      controller.villageController.text =
          userController.user.value!.village ?? '';
      controller.selectedVillage.value =
          userController.user.value!.villageId ?? '';
      controller.idTypeController.text =
          userController.user.value!.idType ?? '';
      controller.idNumberController.text =
          userController.user.value!.idNumber ?? '';
      controller.educationController.text =
          userController.user.value!.education ?? '';

      if (userController.user.value!.job == 'Umum') {
        controller.jobController.text = '1';
      } else if (userController.user.value!.job == 'Kontraktor') {
        controller.jobController.text = '2';
      } else if (userController.user.value!.job == 'Tukang') {
        controller.jobController.text = '3';
      } else if (userController.user.value!.job == 'Mandor') {
        controller.jobController.text = '4';
      }

      controller.birthPlaceController.text =
          userController.user.value!.birthPlace ?? '';
      controller.religionController.text =
          userController.user.value!.religion ?? '';
      controller.maritalController.text =
          userController.user.value!.maritalStatus ?? '';
      selected = controller.maritalController.text;
    }

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nama Lengkap',
                        style: TextStyle(fontSize: 16),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: BaseTextInput(
                          hint: 'Nama Lengkap',
                          controller: controller.nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Masukkan nama lengkap anda';
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Username',
                        style: TextStyle(fontSize: 16),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: BaseTextInput(
                          controller: controller.usernameController,
                          enabled: false,
                          hint: 'Username',
                        ),
                      ),
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 20),
                      const Text(
                        'Jenis Kelamin',
                        style: TextStyle(fontSize: 16),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: BaseDropdown(
                          value: controller.genderController.text == ''
                              ? null
                              : controller.genderController.text,
                          items: _gender
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            controller.genderController.text = value.toString();
                          },
                          validator: 'Pilih jenis kelamin anda',
                          hint: 'Jenis Kelamin',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Tanggal Lahir',
                        style: TextStyle(fontSize: 16),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: BaseDatePicker(
                          hint: 'Tanggal Lahir',
                          controller: controller.birthController,
                          validator: 'Masukkan tanggal lahir anda',
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Alamat',
                        style: TextStyle(fontSize: 16),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: BaseTextArea(
                          hint: 'Alamat',
                          controller: controller.addressController,
                          maxLines: null,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Masukkan alamat anda';
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Kelurahan/Desa',
                        style: TextStyle(fontSize: 16),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: TypeAheadFormField(
                          hideSuggestionsOnKeyboardHide: false,
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: controller.villageController,
                            decoration: const InputDecoration(
                              hintText: 'Kelurahan/Desa',
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Masukkan kelurahan/desa anda';
                            }

                            return null;
                          },
                          onSuggestionSelected: (suggestion) {
                            controller.selectedVillage.value =
                                suggestion.kdKelurahan ?? '';
                            controller.villageController.text =
                                suggestion.namaKelurahan ?? '';
                          },
                          suggestionsCallback: (pattern) => controller.village
                              .where((e) => e.namaKelurahan
                                  .toString()
                                  .toLowerCase()
                                  .contains(pattern))
                              .toList(),
                          itemBuilder: (context, suggest) {
                            return ListTile(
                              title: FadeAnimation(
                                delay: 1,
                                child: Text(suggest.namaKelurahan ?? ''),
                              ),
                              subtitle: FadeAnimation(
                                delay: 1.5,
                                child: Text(suggest.namaKecamatan ?? ''),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Jenis Identitas',
                        style: TextStyle(fontSize: 16),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: BaseDropdown(
                          value: controller.idTypeController.text == ''
                              ? null
                              : controller.idTypeController.text,
                          items: _idType
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            controller.idTypeController.text = value.toString();
                          },
                          validator: 'Pilih jenis identitas anda',
                          hint: 'Jenis Identitas',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'No. Identitas',
                        style: TextStyle(fontSize: 16),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: BaseTextInput(
                          hint: 'No. Identitas',
                          controller: controller.idNumberController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Masukkan no. identitas anda';
                            } else {
                              if (controller.idTypeController.text == 'KTP' &&
                                  value.length < 16) {
                                return 'No. identitas tidak valid';
                              }

                              if (controller.idTypeController.text == 'SIM' &&
                                  value.length < 12) {
                                return 'No. identitas tidak valid';
                              }
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Pendidikan Terakhir',
                        style: TextStyle(fontSize: 16),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: BaseDropdown(
                          value: controller.educationController.text == ''
                              ? null
                              : controller.educationController.text,
                          items: _education
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            controller.educationController.text =
                                value.toString();
                          },
                          validator: 'Pilih pendidikan terakhir anda',
                          hint: 'Pendidikan Terakhir',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Jenis Pekerjaan',
                        style: TextStyle(fontSize: 16),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: BaseDropdown(
                          value: controller.jobController.text == ''
                              ? null
                              : controller.jobController.text,
                          items: _job
                              .map((e) => DropdownMenuItem<String>(
                                    value: e.id,
                                    child: Text(e.jenis),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            controller.jobController.text = value.toString();
                          },
                          validator: 'Pilih jenis pekerjaan anda',
                          hint: 'Jenis Pekerjaan',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Tempat Lahir',
                        style: TextStyle(fontSize: 16),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: BaseTextInput(
                          hint: 'Tempat Lahir',
                          controller: controller.birthPlaceController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Masukkan tempat lahir anda';
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Agama',
                        style: TextStyle(fontSize: 16),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: BaseDropdown(
                          value: controller.religionController.text == ''
                              ? null
                              : controller.religionController.text,
                          items: _religion
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            controller.religionController.text =
                                value.toString();
                          },
                          validator: 'Pilih agama anda',
                          hint: 'Agama',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Status Pernikahan',
                        style: TextStyle(fontSize: 16),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: Row(
                          children: [
                            StatefulBuilder(
                              builder: (context, setState) {
                                return Flexible(
                                  child: RadioGroup.builder(
                                    direction: Axis.horizontal,
                                    groupValue: selected,
                                    textStyle: const TextStyle(fontSize: 16),
                                    activeColor: baseColor,
                                    horizontalAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    onChanged: (value) {
                                      setState(() {
                                        selected = value;
                                      });

                                      controller.maritalController.text =
                                          selected.toString();
                                    },
                                    items: _marital,
                                    itemBuilder: (value) {
                                      return RadioButtonBuilder(
                                        value.toString(),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            width: Get.width,
            child: BaseButton(
              text: 'Update Profile',
              onPressed: () async {
                if (controller.formKey.currentState!.validate()) {
                  controller.updateProfile(picked, context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
