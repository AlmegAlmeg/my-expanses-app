import 'package:flutter/material.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    required this.label,
    required this.validator,
    this.initialValue = "",
    this.textInputType = TextInputType.text,
    super.key,
  });

  final String label;
  final String? Function(String?) validator;
  final dynamic initialValue;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue.toString(),
      keyboardType: textInputType,
      decoration: InputDecoration(
        label: CustomText(text: label),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: keyColor2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: keyColor2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: complementary1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: complementary1),
        ),
      ),
      validator: validator,
    );
  }
}
