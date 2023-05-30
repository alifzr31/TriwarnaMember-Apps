import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/component/base_pin_input.dart';
import 'package:member_apps/app/component/point_text..dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:member_apps/app/modules/input_pin/controller.dart';

class InputPinPage extends StatefulWidget {
  const InputPinPage({super.key});

  @override
  State<InputPinPage> createState() => _InputPinPageState();
}

class _InputPinPageState extends State<InputPinPage> {
  final controller = Get.find<InputPinController>();
  final userController = Get.find<DashboardController>();
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipPath(
                  clipper: WaveClipperOne(flip: true, reverse: true),
                  child: Container(
                    height: 200,
                    color: yellow,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: -10,
                child: ClipPath(
                  clipper: WaveClipperTwo(reverse: true),
                  child: Container(
                    height: 200,
                    color: baseColor,
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const Icon(
                        Iconsax.lock,
                        size: 120,
                        color: baseColor,
                      ),
                      const PointText(
                        text: '***',
                        size: 100,
                        letterSpacing: 10,
                      ),
                      const Text(
                        'Input Your PIN',
                        style: TextStyle(color: baseColor, fontSize: 30),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: BasePinInput(
                          onCompleted: (value) async {
                            final prize = Get.arguments;
                            final prizeCode = prize[0];

                            if (value !=
                                userController.user.value!.pin.toString()) {
                              setState(() {
                                visible = true;
                              });
                            } else {
                              setState(() {
                                visible = false;
                              });

                              controller.redeemPoint(prizeCode);

                              await AwesomeDialog(
                                context: context,
                                animType: AnimType.scale,
                                dialogType: DialogType.success,
                                dismissOnTouchOutside: false,
                                dismissOnBackKeyPress: false,
                                headerAnimationLoop: true,
                                title: 'Redeem Successfully',
                                desc: '${prize[1]} has been redeemed',
                                btnOkColor: baseColor,
                                btnOkOnPress: () {
                                  Get.offAllNamed('/dashboard');
                                },
                              ).show();
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: visible,
                        child: const Text(
                          'PIN is Invalid',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
