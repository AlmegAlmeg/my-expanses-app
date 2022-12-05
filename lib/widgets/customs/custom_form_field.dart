import 'package:flutter/material.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    required this.label,
    required this.validator,
    required this.controller,
    this.textInputType = TextInputType.text,
    super.key,
  });

  final String label;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      cursorColor: darkGrey,
      decoration: InputDecoration(
        label: CustomText(text: label, color: darkGrey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: darkGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: darkGrey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: keyColor2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: keyColor2),
        ),
      ),
      controller: controller,
      validator: validator,
    );
  }
}
