import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/component/base_pin_input.dart';
import 'package:member_apps/app/component/point_text..dart';
import 'package:member_apps/app/component/transparent_appbar.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:member_apps/app/modules/input_pin/controller.dart';

// class InputPinPage extends StatefulWidget {
//   const InputPinPage({super.key});

//   @override
//   State<InputPinPage> createState() => _InputPinPageState();
// }

// class _InputPinPageState extends State<InputPinPage> {
//   final controller = Get.find<InputPinController>();
//   final userController = Get.find<DashboardController>();
//   bool visible = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: Get.height,
//           width: Get.width,
//           child: Stack(
//             children: [
//               Positioned(
//                 left: 0,
//                 right: 0,
//                 bottom: 0,
//                 child: ClipPath(
//                   clipper: WaveClipperOne(flip: true, reverse: true),
//                   child: Container(
//                     height: 200,
//                     color: yellow,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 0,
//                 right: 0,
//                 bottom: -10,
//                 child: ClipPath(
//                   clipper: WaveClipperTwo(reverse: true),
//                   child: Container(
//                     height: 200,
//                     color: baseColor,
//                   ),
//                 ),
//               ),
//               SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 50),
//                       const Icon(
//                         Iconsax.lock,
//                         size: 120,
//                         color: baseColor,
//                       ),
//                       const PointText(
//                         text: '***',
//                         size: 100,
//                         letterSpacing: 10,
//                       ),
//                       const Text(
//                         'Input Your PIN',
//                         style: TextStyle(color: baseColor, fontSize: 30),
//                       ),
//                       const SizedBox(height: 20),
//                       Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 10),
//                         child: BasePinInput(
//                           onCompleted: (value) async {
//                             final prize = Get.arguments;
//                             final prizeCode = prize[0];

//                             if (value !=
//                                 userController.user.value!.pin.toString()) {
//                               setState(() {
//                                 visible = true;
//                               });
//                             } else {
//                               setState(() {
//                                 visible = false;
//                               });

//                               controller.redeemPoint(prizeCode);

//                               await AwesomeDialog(
//                                 context: context,
//                                 animType: AnimType.scale,
//                                 dialogType: DialogType.success,
//                                 dismissOnTouchOutside: false,
//                                 dismissOnBackKeyPress: false,
//                                 headerAnimationLoop: true,
//                                 title: 'Redeem Successfully',
//                                 desc: '${prize[1]} has been redeemed',
//                                 btnOkColor: baseColor,
//                                 btnOkOnPress: () {
//                                   Get.offAllNamed('/dashboard');
//                                 },
//                               ).show();
//                             }
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Visibility(
//                         visible: visible,
//                         child: const Text(
//                           'PIN is Invalid',
//                           style: TextStyle(color: Colors.red, fontSize: 18),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class InputPinPage extends StatefulWidget {
  const InputPinPage({super.key});

  @override
  _InputPinPageState createState() => _InputPinPageState();
}

class _InputPinPageState extends State<InputPinPage> {
  List<String> _pinDigits = List.filled(6, '');
  int _currentDigitIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(_pinDigits);
    return Scaffold(
        appBar: TransparentAppbar(
            title: 'INPUT YOUR PIN',
            preferredSize: Size.fromHeight(kToolbarHeight)),
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: Get.width < 390 ? -50 : -10,
              child: ClipPath(
                clipper: WaveClipperOne(flip: true, reverse: true),
                child: SizedBox(
                  height: 200,
                  child: Material(
                    color: yellow,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: Get.width < 390 ? -60 : -20,
              child: ClipPath(
                clipper: WaveClipperTwo(reverse: true),
                child: SizedBox(
                  height: 200,
                  child: Material(
                    color: baseColor,
                  ),
                ),
              ),
            ),
            pinField(),
          ],
        ));
  }

  bool visible = false;
  final controller = Get.find<InputPinController>();
  final userController = Get.find<DashboardController>();

  Widget pinField() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(
              Iconsax.lock,
              size: Get.width < 390 ? 80 : 100,
              color: baseColor,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 1; i <= 6; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _pinDigits[i - 1].isEmpty
                              ? Colors.grey
                              : baseColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Visibility(
              visible: visible,
              child: const Text(
                'PIN is Invalid',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
            GridView.count(
              crossAxisCount: 3,
              childAspectRatio: Get.width < 390 ? 1.3 : 1,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                for (int i = 1; i <= 9; i++)
                  InkResponse(
                    onTap: () => _updatePinDigit(i.toString()),
                    child: Center(
                      child: Text(
                        i.toString(),
                        style: const TextStyle(fontSize: 32, color: baseColor),
                      ),
                    ),
                  ),
                const SizedBox.shrink(),
                InkResponse(
                  onTap: () => _updatePinDigit('0'),
                  child: const Center(
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 32, color: yellow),
                    ),
                  ),
                ),
                InkResponse(
                  onTap: () => _deletePinDigit(),
                  child: const Icon(
                    Icons.backspace,
                    color: yellow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _updatePinDigit(String digit) async {
    setState(() {
      if (_currentDigitIndex < 6) {
        _pinDigits[_currentDigitIndex] = digit;
        _currentDigitIndex++;
      }
    });

    if (_currentDigitIndex == 6) {
      String pin = _pinDigits.join();
      if (pin == userController.user.value!.pin.toString()) {
        setState(() {
          visible = false;
        });

        final prize = Get.arguments;
        final prizeCode = prize[0];

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
      } else {
        setState(() {
          visible = true;
        });
      }
    }
  }

  void _deletePinDigit() {
    setState(() {
      if (_currentDigitIndex > 0) {
        _currentDigitIndex--;
        _pinDigits[_currentDigitIndex] = '';
      }
      visible = false;
    });
  }
}
