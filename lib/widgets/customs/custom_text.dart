import 'package:flutter/material.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    this.textAlign = TextAlign.center,
    this.color = white,
    this.fontSize = FontSizes.text21,
    super.key,
  });

  final String text;
  final TextAlign textAlign;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
