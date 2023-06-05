import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/core/value.dart';

class BaseSearchInput extends StatelessWidget {
  const BaseSearchInput({
    Key? key,
    required this.hint,
    this.onChanged,
  }) : super(key: key);

  final String hint;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: const Icon(EvaIcons.search),
        suffixIconColor: baseColor,
        hintStyle: const TextStyle(fontStyle: FontStyle.italic),
        contentPadding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: baseColor),
        ),
      ),
      style: const TextStyle(
        color: baseColor,
      ),
    );
  }
}
