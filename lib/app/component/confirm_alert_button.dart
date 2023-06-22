import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:member_apps/app/core/value.dart';

class ConfirmAlertButton extends StatelessWidget {
  const ConfirmAlertButton({
    Key? key,
    required this.btnText,
    required this.width,
    required this.height,
    this.alertTitle,
    this.alertDesc,
    this.body,
    this.onCancelPressed,
    this.onSubmitPressed,
  }) : super(key: key);

  final String btnText;
  final String? alertTitle;
  final String? alertDesc;
  final Widget? body;
  final double width;
  final double height;
  final void Function()? onCancelPressed;
  final void Function()? onSubmitPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: AnimatedButton(
        text: btnText,
        color: baseColor,
        buttonTextStyle: const TextStyle(color: yellow),
        pressEvent: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.topSlide,
            dismissOnTouchOutside: true,
            dismissOnBackKeyPress: false,
            headerAnimationLoop: true,
            btnCancel: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: yellow,
                foregroundColor: baseColor,
              ),
              onPressed: onCancelPressed,
              child: const Text('Cancel'),
            ),
            btnOkColor: baseColor,
            btnOk: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: baseColor,
                foregroundColor: yellow,
              ),
              onPressed: onSubmitPressed,
              child: const Text('Okay'),
            ),
            padding: const EdgeInsets.all(10),
            title: alertTitle,
            desc: alertDesc,
          ).show();
        },
      ),
    );
  }
}
