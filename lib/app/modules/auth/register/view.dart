import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/component/base_button.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/auth/controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: -80,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: baseColor.withOpacity(0.5),
            ),
          ),
          Positioned(
            top: -30,
            right: -45,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: baseColor.withOpacity(0.5),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Get.width < 390
                            ? Get.height * 0.08
                            : Get.height * 0.1),
                    child: Image.asset(
                      'assets/images/login.png',
                      height: 80,
                    ),
                  ),
                  const RegisterForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool showPass = true;
  bool showPassConfirm = true;

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Get.width < 390 ? smallPhone() : normalPhone(),
    );
  }

  Widget smallPhone() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: controller.formKeyRegister,
            child: Column(
              children: [
                BaseTextInput(
                  label: 'Nama Lengkap',
                  controller: controller.fullNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Silahkan isi nama lengkap anda';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                BaseTextInput(
                  label: 'Email',
                  controller: controller.emailRegisController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Silahkan isi email anda';
                    } else {
                      if (!value.isEmail) {
                        return 'Masukkan email dengan benar';
                      }
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                BaseTextInput(
                  label: 'No. Telepon',
                  controller: controller.contactController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Silahkan isi no. telepon anda';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                BaseTextInput(
                  label: 'Password',
                  controller: controller.passwordRegisController,
                  obscureText: showPass,
                  keyboardType: TextInputType.visiblePassword,
                  icon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                    icon: Icon(
                        showPass ? Icons.visibility : Icons.visibility_off),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Silahkan isi password anda';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                BaseTextInput(
                  label: 'Konfirmasi Password',
                  controller: controller.passwordConfirmController,
                  obscureText: showPassConfirm,
                  keyboardType: TextInputType.visiblePassword,
                  icon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassConfirm = !showPassConfirm;
                      });
                    },
                    icon: Icon(showPassConfirm
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Silahkan isi konfirmasi password';
                    } else if (value !=
                        controller.passwordRegisController.text) {
                      return 'Konfirmasi password tidak sesuai';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            width: Get.width,
            child: BaseButton(
              text: 'Register',
              onPressed: () {
                if (controller.formKeyRegister.currentState!.validate()) {
                  controller.register(context);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sudah mempunyai akun? '),
                GestureDetector(
                  onTap: () {
                    Get.offAndToNamed('/login');
                  },
                  child: const Text(
                    'Log In disini',
                    style: TextStyle(color: baseColor),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget normalPhone() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKeyRegister,
              child: Column(
                children: [
                  BaseTextInput(
                    label: 'Nama Lengkap',
                    controller: controller.fullNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Silahkan isi nama lengkap anda';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  BaseTextInput(
                    label: 'Email',
                    controller: controller.emailRegisController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Silahkan isi email anda';
                      } else {
                        if (!value.isEmail) {
                          return 'Masukkan email dengan benar';
                        }
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  BaseTextInput(
                    label: 'No. Telepon',
                    controller: controller.contactController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Silahkan isi no. telepon anda';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  BaseTextInput(
                    label: 'Password',
                    controller: controller.passwordRegisController,
                    obscureText: showPass,
                    keyboardType: TextInputType.visiblePassword,
                    icon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                      icon: Icon(
                          showPass ? Icons.visibility : Icons.visibility_off),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Silahkan isi password anda';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  BaseTextInput(
                    label: 'Konfirmasi Password',
                    controller: controller.passwordConfirmController,
                    obscureText: showPassConfirm,
                    keyboardType: TextInputType.visiblePassword,
                    icon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassConfirm = !showPassConfirm;
                        });
                      },
                      icon: Icon(showPassConfirm
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Silahkan isi konfirmasi password';
                      } else if (value !=
                          controller.passwordRegisController.text) {
                        return 'Konfirmasi password tidak sesuai';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
          width: Get.width,
          child: BaseButton(
            text: 'Register',
            onPressed: () {
              if (controller.formKeyRegister.currentState!.validate()) {
                controller.register(context);
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sudah mempunyai akun? '),
              GestureDetector(
                onTap: () {
                  Get.offAndToNamed('/login');
                },
                child: const Text(
                  'Log In disini',
                  style: TextStyle(color: baseColor),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
