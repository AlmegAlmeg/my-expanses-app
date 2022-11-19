import 'package:flutter/material.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    required this.text,
    required this.activeColor,
    required this.value,
    required this.group,
    required this.changeFun,
    super.key,
  });

  final String text;
  final Color activeColor;
  final dynamic value;
  final dynamic group;
  final void Function(dynamic) changeFun;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomText(text: text, textAlign: TextAlign.right),
      contentPadding: EdgeInsets.zero,
      leading: Radio(
        activeColor: activeColor,
        value: value,
        groupValue: group,
        onChanged: changeFun,
      ),
    );
  }
}
