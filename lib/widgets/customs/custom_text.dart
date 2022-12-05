import 'package:flutter/material.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    this.textAlign = TextAlign.start,
    this.color,
    this.fontSize = FontSizes.text21,
    this.textDirection = TextDirection.rtl,
    super.key,
  });

  final String text;
  final TextAlign textAlign;
  final Color? color;
  final double fontSize;
  final TextDirection textDirection;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      style: TextStyle(
        color: color ?? lightGrey,
        fontSize: fontSize,
        fontFamily: "Arimo",
      ),
    );
  }
}
