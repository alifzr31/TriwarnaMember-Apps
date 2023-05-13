import 'package:flutter/material.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:pinput/pinput.dart';

class BasePinInput extends StatelessWidget {
  const BasePinInput({
    Key? key,
    this.controller,
    this.focusNode,
    this.validator,
    this.onCompleted,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: controller,
        focusNode: focusNode,
        androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
        listenForMultipleSmsOnAndroid: true,
        keyboardType: TextInputType.number,
        length: 6,
        useNativeKeyboard: true,
        validator: validator,
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onCompleted: onCompleted,
        onChanged: onChanged,
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: 22,
              height: 1,
              color: baseColor,
            ),
          ],
        ),
      ),
    );
  }
}
